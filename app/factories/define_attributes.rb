# DefineAttributes
module DefineAttributes
  def self.included(base)
    base.extend(ClassMethods)
  end

  # ClassMethods
  module ClassMethods
    # rubocop:disable Metrics/MethodLength
    # rubocop:disable Metrics/AbcSize
    def define_attributes(attrs_list)
      attr_accessor(*attrs_list, :resource)

      define_method('initialize') do |resource, resource_id = nil|
        @resource = if resource_id
                      resource.find(resource_id)
                    else
                      resource.new("#{resource.model_name.param_key}_type" => resource.model_name.param_key)
                    end

        attrs_list.each do |attribute|
          instance_variable_set("@#{attribute}", send("resource_#{attribute}"))
        end
      end

      attrs_list.each do |attribute|
        define_method("resource_#{attribute}") do
          attribute_obj = Attribute.find_by(name: attribute.to_s)
          if resource.persisted?
            resource.attribute_values.find_by(resource_attribute: attribute_obj)
          else
            resource.attribute_values.new(resource_attribute: attribute_obj)
          end
        end

        private "resource_#{attribute}".to_sym
      end
    end
  end
end
