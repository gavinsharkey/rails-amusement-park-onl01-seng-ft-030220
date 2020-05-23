class ChangeTicketsDefaultForUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :tickets, :integer, default: 0
  end
end
