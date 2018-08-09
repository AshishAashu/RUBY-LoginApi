class AddApikeyToApiuser < ActiveRecord::Migration[5.1]
  def change
    add_column :apiusers, :apikey, :string
  end
end
