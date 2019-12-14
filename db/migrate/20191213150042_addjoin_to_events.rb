class AddjoinToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :join, :integer
  end
end
