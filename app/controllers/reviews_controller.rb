class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show update destroy ]
  before_action :set_reviewable, except: :index
  before_action :authenticate_request
  before_action :check_moderators, only: %i[ destroy update ]
  before_action :check_owner, only: %i[ destroy update ]


  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews, include: :review_responses
  end

  # GET /reviews/1
  def show
    render json: @review, include: [:review_responses, :proofs, :photo_proofs]
  end

  # POST /reviews
  def create
    
    @review = @reviewable.reviews.new(review_params)
    @review.user_id = @current_user.id
    @review.product_id = @reviewable.id
    @review.category_id = @reviewable.category_id
    if @review.save
      @product = Product.find_by(id: @review.product_id).calculate_average
      @product = Product.find_by(id: @review.product_id).calculate_metrics
      render json: @review, include: :review_responses, include: @review.comments, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:category_id, :product_id, :user_id, :rev_comment, :have_proof, review_responses_attributes:[:metric, :rate], proofs_attributes:[:code, :verified], photo_proofs_attributes:[:image])
    end

    def set_reviewable
      resource, id = request.path.split('/')[1,2]
      @reviewable = resource.singularize.classify.constantize.friendly.find(id)
    end

    def check_owner
      if @review.user_id != @current_user.id || @current_user.moderator == false
        render json: "You are not authorized.", status: :unprocessable_entity
      else
      end
     end
  
end
