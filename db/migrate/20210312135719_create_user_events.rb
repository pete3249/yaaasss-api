class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events do |t|
      t.references :event_creator, index:true, foreign_key: {to_table: :events}
      t.references :invited_user, index:true, foreign_key: {to_table: :users}
      t.references :event, null: false, foreign_key: true
      t.boolean :going, default: false, null: false

      t.timestamps
    end
  end
end
