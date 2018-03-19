class Category < ApplicationRecord
  has_ancestry orphan_strategy: :destroy
  
  validates :title, presence: {message: "名称不能为空！"}
  validates :title, uniqueness: {message: "名称不能重复！"}

  has_many :products, dependent: :destroy

  before_validation :corrent_ancestry

  private
  def corrent_ancestry
    self.ancestry = nil if self.ancestry.blank?
  end
end
