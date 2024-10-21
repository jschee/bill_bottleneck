class AddMissingFieldsToBillAction < ActiveRecord::Migration[8.0]
  def change
    add_column :bill_actions, :recorded_votes, :jsonb
    add_column :bill_actions, :calendar_number, :jsonb
    add_column :bill_actions, :committees, :jsonb
  end
end
