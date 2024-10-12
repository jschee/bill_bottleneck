class CreateBillSummaries < ActiveRecord::Migration[8.0]
  def change
    create_table :bill_summaries do |t|
      t.belongs_to :bill, null: false, foreign_key: true
      t.string :action_date
      t.string :action_desc
      t.string :text
      t.string :update_date
      t.string :version_code

      t.timestamps
    end
  end
end
