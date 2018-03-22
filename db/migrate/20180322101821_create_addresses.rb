class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address_type, comment: "地址类型"
      t.string :contract_name, :mobile_phone, :address, :zipcode

      t.timestamps
    end

    add_index :addresses, [:user_id, :address_type]
  end
end
