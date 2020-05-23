class ChangeHeightDefaultForUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :height, :integer, default: 0
  end
end
