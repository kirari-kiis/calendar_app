class ChangeDataDescriptionToEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :description, :text
  end
end
