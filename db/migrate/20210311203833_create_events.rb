class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.string :address
      t.string :notes
      t.references :event_creator, index:true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
