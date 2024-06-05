class CreateCustomRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :custom_records do |t|
      t.references :custom_object, null: false, foreign_key: true
      t.jsonb :data

      t.timestamps
    end
  end
end
