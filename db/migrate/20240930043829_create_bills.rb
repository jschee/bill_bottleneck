class CreateBills < ActiveRecord::Migration[8.0]
  def change
    create_table :bills do |t|
      t.integer :congress
      t.string :bill_type
      t.string :number
      t.string :origin_chamber
      t.string :origin_chamber_code
      t.string :title
      t.string :update_date
      t.string :update_date_including_text
      t.jsonb :latest_action
      t.string :url
      t.jsonb :cached_query_response


      t.timestamps
    end
  end
end
