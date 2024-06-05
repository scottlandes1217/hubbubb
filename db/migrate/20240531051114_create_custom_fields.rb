class CreateCustomFields < ActiveRecord::Migration[7.1]
  def change
    create_table :custom_fields do |t|
      t.references :custom_object, null: false, foreign_key: true
      t.string :name
      t.string :field_type

      t.timestamps
    end
  end
end
