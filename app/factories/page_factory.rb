class PageFactory < FactoryBase
  ATTRS = %i[title desc]

  define_attributes(ATTRS)

  def self.find(page_id)
    new(page_id)
  end
end
