class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

  validates_presence_of :email, message: "邮箱不能为空！"
  validates :email, uniqueness: true
  validates_presence_of :password, message: "密码不能为空！"
  validates_presence_of :password_confirmation, message: "密码确认不能为空！"
  validates_confirmation_of :password, message: "密码不一致。"
end
