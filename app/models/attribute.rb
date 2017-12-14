class Attribute < ApplicationRecord
  has_many :attribute_values, as: :resource
  has_many :resources, through: :attribute_values, source_type: 'Page'
end
