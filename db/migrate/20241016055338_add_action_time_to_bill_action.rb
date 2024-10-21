class AddActionTimeToBillAction < ActiveRecord::Migration[8.0]
  def change
    add_column :bill_actions, :action_time, :string
  end
end
