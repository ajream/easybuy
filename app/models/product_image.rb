class ProductImage < ApplicationRecord
  belongs_to :product

  has_attached_file :image, styles: { 
    thumb: "100x100>",
    medium: "300x300>", 
    big: "960x"
  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_size :image, in: 0..10.megabytes
end
