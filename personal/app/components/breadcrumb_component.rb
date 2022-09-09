# frozen_string_literal: true

class BreadcrumbComponent < ViewComponent::Base
  attr_reader :crumbs

  def initialize(crumbs)
    @crumbs = crumbs
  end
end
