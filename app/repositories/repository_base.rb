class RepositoryBase
  include ActiveModel::Validations

  attr_accessor :obj

  def initialize(obj)
    @obj = obj
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
    wrapper(return_flag: 'obj') do
      ->(attr_, _attr_name) { attr_.destroy }
    end
  end

  private

  def wrapper(return_flag: 'status')
    resource_obj = obj.resource
    resource_obj.attribute_values.map do |attr_|
      attr_name = attr_.resource_attribute.name.to_sym
      yield.call(attr_, attr_name)
    end
    method_return(return_flag, resource_obj)
  end

  def method_return(return_flag, resource_obj)
    case return_flag
    when 'status'
      resource_obj.save
    when 'obj'
      obj
    end
  end
end
