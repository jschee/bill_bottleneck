class CreateBillTextVersions < ActiveRecord::Migration[8.0]
  def change
    create_table :bill_text_versions do |t|
      t.date :date
      t.string :text_type
      t.jsonb :formats
      t.string :text
      t.belongs_to :bill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
