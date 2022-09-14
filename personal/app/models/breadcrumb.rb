class Breadcrumb
  attr_reader :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end

  def link?
    @path.present?
  end

  def last?(crumbs)
    self == crumbs.last
  end

  def postion(crumbs)
    crumbs.index(self) + 1
  end
end
