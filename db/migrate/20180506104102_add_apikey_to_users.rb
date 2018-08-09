class AddApikeyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :apikey, :string
  end
end
