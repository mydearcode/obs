class Comments::ReportsController < ReportsController
    before_action :set_reportable
    
    private
    def set_reportable
        @reportable = Comment.find(params[:comment_id])
    end
    
    
    end