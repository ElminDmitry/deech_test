class PageFactory < FactoryBase
  ATTRS = %i[title desc]

  define_attributes(ATTRS)
end
