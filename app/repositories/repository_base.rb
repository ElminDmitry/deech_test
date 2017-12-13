class RepositoryBase
  include ActiveModel::Validations

  attr_accessor :resource

  def initialize(resource)
  	@resource = resource
  end

  def save(params)
  	page = resource.page
    page.attribute_values.map do |attr_|
      attr_name = attr_.page_attribute.name.to_sym
      attr_.value = params[attr_name]
    end
  	page.save
  end

  # TODO: implement following logic
  def update(params)
  	page = resource.page
    page.attribute_values.map do |attr_|
      attr_name = attr_.page_attribute.name.to_sym
      attr_.update(value: params[attr_name])
    end
  	page.save
  end

  def delete
  	page = resource.page
    page.attribute_values.map do |attr_|
      attr_name = attr_.page_attribute.name.to_sym
      attr_.destroy
    end
  	resource
  end
end
