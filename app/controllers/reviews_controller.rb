class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show update destroy ]
  before_action :set_reviewable, except: :index

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews, include: :review_responses
  end

  # GET /reviews/1
  def show
    render json: @review, include: :review_responses
  end

  # POST /reviews
  def create
    
    @review = @reviewable.reviews.new(review_params)

    if @review.save
      render json: @review, include: :review_responses, status: :created
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
      params.require(:review).permit(:category_id, :product_id, :user_id, review_responses_attributes:[:metric, :rate])
    end

    def set_reviewable
      resource, id = request.path.split('/')[1,2]
      @reviewable = resource.singularize.classify.constantize.friendly.find(id)
    end
  
end
