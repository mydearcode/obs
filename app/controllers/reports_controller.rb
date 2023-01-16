class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show update destroy ]
  before_action :check_moderators, except: %i[create index]
  # GET /reports
  def index
   
    @reports = Report.all

    render json: @reports
  end

  # GET /reports/1
  def show
    render json: @report
  end

  # POST /reports
  def create
    @report = @reportable.reports.new(report_params)
    @report.user_id = @current_user.id

    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:body, :subject, :reportable_id, :reportable_type, :user_id)
    end
end
