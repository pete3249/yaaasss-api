class RemoveColumnFromUserEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_events, :event_creator_id
  end
end
