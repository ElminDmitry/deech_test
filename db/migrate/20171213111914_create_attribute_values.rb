class CreateAttributeValues < ActiveRecord::Migration[5.1]
  def change
    create_table :attribute_values do |t|
      t.integer :resource_id
      t.string  :resource_type
      t.references :attribute, foreign_key: true
      t.string :value

      t.timestamps
    end
    add_index :attribute_values, [:resource_type, :resource_id]
  end
end
