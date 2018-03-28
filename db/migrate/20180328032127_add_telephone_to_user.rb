class AddTelephoneToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :telephone, :string
    remove_index :users, :email
    add_index :users, :email
    add_index :users, :telephone

    change_column :users, :email, :string, null: true
  end
end
