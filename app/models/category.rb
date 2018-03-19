class Category < ApplicationRecord
  acts_as_tree
  
  validates :title, presence: {message: "名称不能为空！"}

  has_many :products, dependent: :destroy

  before_validation :corrent_ancestry

  private
  def corrent_ancestry
    self.ancestry = nil if self.ancestry.blank?
  end
end
