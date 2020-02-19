class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event
      t.date :start_date
      t.time :time
      t.text :description
      t.integer :user_id
      t.integer :join

      t.timestamps
    end
  end
end
