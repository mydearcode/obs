class Reviews::CommentsController < CommentsController
before_action :set_commentable

private
def set_commentable
    @commentable = Review.find(params[:review_id])
end


end