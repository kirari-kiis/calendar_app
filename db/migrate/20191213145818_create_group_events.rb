class CreateGroupEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :group_events do |t|
      t.string :group_event
      t.date :date
      t.time :time
      t.text :description

      t.timestamps
    end
  end
end
