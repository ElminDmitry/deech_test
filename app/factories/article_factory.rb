class ArticleFactory < FactoryBase
  ATTRS = %i[title desc author]

  define_attributes(ATTRS)
end
