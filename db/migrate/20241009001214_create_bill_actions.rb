class CreateBillActions < ActiveRecord::Migration[8.0]
  def change
    create_table :bill_actions do |t|
      t.string :action_code
      t.string :action_date
      t.jsonb :source_system
      t.string :text
      t.string :action_type
      t.belongs_to :bill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
