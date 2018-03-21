class ShoppingCart < ApplicationRecord

  validates :user_uuid, presence: true
  validates :product_id, presence: true
  validates :amount, presence: true

  belongs_to :product

  scope :by_user_uuid, -> (user_uuid) { where(user_uuid: user_uuid) }

  def self.create_or_update! opt = {}
    cond = {
      user_uuid: opt[:user_uuid],
      product_id: opt[:product_id]
    }

    record = where(cond).first

    if record
      record.update_attributes!(opt.merge(amount: record.amount + opt[:amount]))
    else
      record = create!(opt)
    end

    record
  end

end
