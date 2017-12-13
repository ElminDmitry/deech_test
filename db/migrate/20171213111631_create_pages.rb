class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :page_type

      t.timestamps
    end
  end
end
