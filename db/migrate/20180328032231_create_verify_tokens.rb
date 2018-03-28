class CreateVerifyTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :verify_tokens do |t|
      t.string :token, comment: "验证码"
      t.string :telephone
      t.datetime :expired_at

      t.timestamps
    end

    add_index :verify_tokens, [:telephone, :token]
  end
end
