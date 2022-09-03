require "application_system_test_case"

class Pireps::RawReportsTest < ApplicationSystemTestCase
  setup do
    @pireps_raw_report = pireps_raw_reports(:one)
  end

  test "visiting the index" do
    visit pireps_raw_reports_url
    assert_selector "h1", text: "Raw reports"
  end

  test "should create raw report" do
    visit pireps_raw_reports_url
    click_on "New raw report"

    click_on "Create Raw report"

    assert_text "Raw report was successfully created"
    click_on "Back"
  end

  test "should update Raw report" do
    visit pireps_raw_report_url(@pireps_raw_report)
    click_on "Edit this raw report", match: :first

    click_on "Update Raw report"

    assert_text "Raw report was successfully updated"
    click_on "Back"
  end

  test "should destroy Raw report" do
    visit pireps_raw_report_url(@pireps_raw_report)
    click_on "Destroy this raw report", match: :first

    assert_text "Raw report was successfully destroyed"
  end
end
