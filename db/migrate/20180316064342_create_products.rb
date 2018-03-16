class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :title
      t.string :status, default: 'off', comment: "标记上下架"
      t.integer :amount, default: 0
      t.string :uuid
      t.decimal :msrp, precision: 10, scale: 2, comment: "原价"
      t.decimal :price, precision: 10, scale: 2, comment: "零售价"
      t.text :description

      t.timestamps
    end

    add_index :products, [:status, :category_id]
    add_index :products, [:category_id]
    add_index :products, [:uuid]
    add_index :products, [:title]
  end
end
