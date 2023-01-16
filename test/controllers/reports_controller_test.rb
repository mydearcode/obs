require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get reports_url, as: :json
    assert_response :success
  end

  test "should create report" do
    assert_difference("Report.count") do
      post reports_url, params: { report: { body: @report.body, reportable_id: @report.reportable_id, reportable_type: @report.reportable_type, subject: @report.subject, user_id: @report.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show report" do
    get report_url(@report), as: :json
    assert_response :success
  end

  test "should update report" do
    patch report_url(@report), params: { report: { body: @report.body, reportable_id: @report.reportable_id, reportable_type: @report.reportable_type, subject: @report.subject, user_id: @report.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy report" do
    assert_difference("Report.count", -1) do
      delete report_url(@report), as: :json
    end

    assert_response :no_content
  end
end
