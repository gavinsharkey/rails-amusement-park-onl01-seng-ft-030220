class ChangeHappinessDefaultForUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :happiness, :integer, default: 0
  end
end
