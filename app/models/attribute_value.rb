class AttributeValue < ApplicationRecord
  belongs_to :page
  belongs_to :attribute
end
