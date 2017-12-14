module FlexibleExt
  extend ActiveSupport::Concern

  included do
    has_many :attribute_values, as: :resource
    has_many :resource_attributes, through: :attribute_values, class_name: 'Attribute', foreign_key: 'attribute_id'
  end
end
