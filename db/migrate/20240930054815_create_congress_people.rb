class CreateCongressPeople < ActiveRecord::Migration[8.0]
  def change
    create_table :congress_people do |t|
      t.string :bioguide_id
      t.string :birth_year
      t.string :direct_order_name
      t.string :first_name
      t.string :honorific_name
      t.string :inverted_order_name
      t.string :last_name
      t.string :state
      t.jsonb :cached_query_response
      t.string :image_url
      t.string :image_attribution
      t.string :url

      t.timestamps
    end

    add_index :congress_people, :bioguide_id, unique: true
  end
end
