# frozen_string_literal: true

class BreadcrumbComponent < ViewComponent::Base
  attr_reader :crumbs, :style

  def initialize(crumbs, style = '--bs-breadcrumb-margin-bottom: 0rem;')
    @crumbs = crumbs
    @style = style
  end
end
