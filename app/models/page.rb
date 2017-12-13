class Page < ApplicationRecord
  has_many :attribute_values
  has_many :page_attributes, through: :attribute_values, class_name: 'Attribute', foreign_key: 'attribute_id'
end
