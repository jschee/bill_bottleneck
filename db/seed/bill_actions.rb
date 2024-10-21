# frozen_string_literal: true

def action_params(action)
  action['action_type'] = action['type']
  action.delete('type')
  action
end

def seed_actions(bill)
  res = bill.fetch_actions
  res['actions'].each do |action|
    bill.actions << Bill::Action.new(action_params(action))
  end
end

Bill.without_actions.each do |bill|
  next unless bill.actions.count.zero?

  seed_actions(bill)
end
