class AddApiuserkeyToApiuser < ActiveRecord::Migration[5.1]
  def change
    add_column :apiusers, :apiuserkey, :string
  end
end
