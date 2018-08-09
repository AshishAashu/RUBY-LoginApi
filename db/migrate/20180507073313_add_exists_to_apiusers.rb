class AddExistsToApiusers < ActiveRecord::Migration[5.1]
  def change
    add_column :apiusers, :exists, :string
  end
end
