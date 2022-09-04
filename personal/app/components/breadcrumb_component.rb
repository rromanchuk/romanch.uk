# frozen_string_literal: true

class BreadcrumbComponent < ViewComponent::Base
  attr_reader :crumbs

  def initialize(crumbs)
    @crumbs = crumbs
  end

  def bread_crumbs(crumbs)
    html_values = ''
    crumbs.each do |crumb|
      status = crumb.link? ? 'text-white' : 'active'
      html_values += content_tag(:li, class: "breadcrumb-item #{status} ") do
        if crumb.link?
          link_to(crumb.name, crumb.path)
        else
          crumb.name
        end
      end
    end
    html_values.html_safe
  end
end
