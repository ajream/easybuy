class Product < ApplicationRecord

  validates :title, presence: { message: "名称不能为空。" }
  validates :category_id, presence: { message: "分类不能为空。" }
  validates :status, inclusion: { in: %w[on off], message: "商品状态必须为 on 或者 off。" }
  validates :amount, presence: { message: "库存不能为空。" }
  validates :amount, numericality: { only_integer: true, message: "库存必须为整数。" }, if: proc { |product| product.msrp.present? }
  validates :msrp, presence: { message: "MSRP不能为空。" }
  validates :msrp, numericality: { message: "MSRP必须为数字。" }, if: proc { |product| product.msrp.present? }
  validates :price, presence: { message: "价格不能为空。" }
  validates :price, numericality: { only_integer: true, message: "价格必须为数字。" }, if: proc { |product| product.msrp.present? }
  validates :description, presence: { message: "描述不能为空。" }

  belongs_to :category, optional: true

  before_create :set_default_attrs

  private
  def set_default_attrs
    self.uuid = RandomCode.generate_product_uuid
  end
end 
