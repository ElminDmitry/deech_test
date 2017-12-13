class AttributeValue < ApplicationRecord
  belongs_to :page
  belongs_to :page_attribute, class_name: 'Attribute', foreign_key: 'attribute_id'
end
