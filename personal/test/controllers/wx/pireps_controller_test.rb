# frozen_string_literal: true

require 'test_helper'

class Wx::PirepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! "personal.test"
    @pirep = wx_pireps(:ua)
    @urgent = wx_pireps(:uua)
  end

  test 'should get index' do
    get wx_pireps_url
    assert_response :success
    assert_not_empty(@controller.breadcrumbs)
  end

  test 'urgent filter' do
    get wx_pireps_url(filter: 'uua')
    assert_response :success
    assert_includes(@controller.pireps, @urgent)
    assert_not_empty(@controller.breadcrumbs)
  end

  test 'routine filter' do
    get wx_pireps_url(filter: 'ua')
    assert_response :success
    assert_includes(@controller.pireps, @pirep)
    assert_not_empty(@controller.breadcrumbs)
  end

  test 'should show pireps_raw_report' do
    get wx_pirep_url(@pirep)
    assert_response :success
  end
end
