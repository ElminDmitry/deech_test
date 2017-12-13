class CreateAttributeValues < ActiveRecord::Migration[5.1]
  def change
    create_table :attribute_values do |t|
      t.references :page, foreign_key: true
      t.references :attribute, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
