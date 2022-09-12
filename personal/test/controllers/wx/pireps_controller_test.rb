require 'test_helper'

class Wx::PirepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pirep = wx_pireps(:ua)
  end

  test 'should get index' do
    get wx_pireps_url
    assert_response :success
  end

  # test "should get new" do
  #   get new_pireps_raw_report_url
  #   assert_response :success
  # end

  # test "should create pireps_raw_report" do
  #   assert_difference("Pireps::RawReport.count") do
  #     post pireps_raw_reports_url, params: { pireps_raw_report: {  } }
  #   end

  #   assert_redirected_to pireps_raw_report_url(Pireps::RawReport.last)
  # end

  test 'should show pireps_raw_report' do
    get wx_pirep_url(@pirep)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_pireps_raw_report_url(@pireps_raw_report)
  #   assert_response :success
  # end

  # test "should update pireps_raw_report" do
  #   patch pireps_raw_report_url(@pireps_raw_report), params: { pireps_raw_report: {  } }
  #   assert_redirected_to pireps_raw_report_url(@pireps_raw_report)
  # end

  # test "should destroy pireps_raw_report" do
  #   assert_difference("Pireps::RawReport.count", -1) do
  #     delete pireps_raw_report_url(@pireps_raw_report)
  #   end

  #   assert_redirected_to pireps_raw_reports_url
  # end
end
