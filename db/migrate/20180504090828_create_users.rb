class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    attr_accessor :name, :address
    create_table :users do |t|
      t.column :name, :string, :limit => 32, :null => false
      t.column :address, :string
      t.timestamps
    end
  end
end
