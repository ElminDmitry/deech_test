class Attribute < ApplicationRecord
  has_many :attribute_values
  has_many :pages, through: :attribute_values
end
