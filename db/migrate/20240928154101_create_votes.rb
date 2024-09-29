class CreateVotes < ActiveRecord::Migration[8.0]
  def change
    create_table :votes do |t|
      t.belongs_to :bill_post, null: false, foreign_key: true
      t.integer :vote_type

      t.timestamps
    end
  end
end
