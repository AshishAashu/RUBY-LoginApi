class CreateApiusers < ActiveRecord::Migration[5.1]
  def change
    create_table :apiusers do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :password, :string
      t.timestamps
    end
  end
end
