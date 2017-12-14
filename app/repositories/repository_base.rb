class RepositoryBase
  include ActiveModel::Validations

  attr_accessor :resource

  def initialize(resource)
    @resource = resource
  end

  def save(params)
    wrapper do
      ->(attr_, attr_name) { attr_.value = params[attr_name] }
    end
  end

  def update(params)
    wrapper do
      ->(attr_, attr_name) { attr_.update(value: params[attr_name]) }
    end
  end

  def delete
    wrapper do
      ->(attr_, _attr_name) { attr_.destroy }
    end
  end

  private

  def wrapper(return_flag: 'status')
    page = resource.page
    page.attribute_values.map do |attr_|
      attr_name = attr_.page_attribute.name.to_sym
      yield.call(attr_, attr_name)
    end
    method_return(return_flag, page)
  end

  def method_return(return_flag, page)
    case return_flag
    when 'status'
      page.save
    when 'resource'
      resource
    end
  end
end
