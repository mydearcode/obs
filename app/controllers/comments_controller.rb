class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show update destroy ]
  #before_action :set_commentable, except: :index
  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    @replies = @comment.comments 
    render json: {comment: @comment, replies: @replies}
  end

  # POST /comments
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = @current_user.id
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body)
    end

    # def set_commentable
    #   if params[:comment].present?
    #     @commentable = Comment.find(params[:comment_id])
        
    #   elsif params[:category_id].present?
    #     @commentable = Review.find(params[:review_id])
    #   end
    # end



    # def set_commentable
    #   resource, id = request.path.split('/')[3,4]
    #   @commentable = resource.singularize.classify.constantize.find(id)
    # end
end
