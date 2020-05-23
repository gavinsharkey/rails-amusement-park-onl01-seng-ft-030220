class ChangeNauseaDefaultForUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :nausea, :integer, default: 0
  end
end
