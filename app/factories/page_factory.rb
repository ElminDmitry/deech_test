class PageFactory < FactoryBase
  attr_accessor :page, :title

  def initialize
    @page = Page.new page_type: 'page'
    @title = page_title
  end

  private

  def page_title
    title_attr = Attribute.find_by(name: 'title')
    page.attribute_values.new page_attribute: title_attr
  end

end