class Reviews::ReportsController < ReportsController
before_action :set_reportable

private
def set_reportable
    @reportable = Review.find(params[:review_id])
end


end