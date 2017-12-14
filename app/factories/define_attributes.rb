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
      attr_accessor(*attrs_list, :page)

      define_method('initialize') do |page_id = nil|
        @page = if page_id
                  Page.find(page_id)
                else
                  Page.new(page_type: 'page')
                end

        attrs_list.each do |attribute|
          instance_variable_set("@#{attribute}", send("page_#{attribute}"))
        end
      end

      attrs_list.each do |attribute|
        define_method("page_#{attribute}") do
          attribute_obj = Attribute.find_by(name: attribute.to_s)
          if page.persisted?
            page.attribute_values.find_by(page_attribute: attribute_obj)
          else
            page.attribute_values.new(page_attribute: attribute_obj)
          end
        end

        private "page_#{attribute}".to_sym
      end
    end
  end
end
