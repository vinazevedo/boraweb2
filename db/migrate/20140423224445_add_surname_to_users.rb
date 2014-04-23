class AddSurnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :surname, :string
    add_index :users, :surname
  end
end
