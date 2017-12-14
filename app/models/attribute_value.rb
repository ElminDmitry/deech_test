class AttributeValue < ApplicationRecord
  belongs_to :resource, polymorphic: true, optional: true
  belongs_to :resource_attribute, class_name: 'Attribute', foreign_key: 'attribute_id'
end
