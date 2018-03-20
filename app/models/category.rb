class Category < ApplicationRecord
  has_ancestry orphan_strategy: :destroy
  
  validates :title, presence: {message: "名称不能为空！"}
  validates :title, uniqueness: {message: "名称不能重复！"}

  has_many :products, dependent: :destroy

  before_validation :corrent_ancestry

  def self.group_data
    self.roots.order("weight DESC").inject([]) do |result, parent|
      row = []
      row << parent
      row << parent.children.order("weight DESC")
      result << row
    end
  end

  private
  def corrent_ancestry
    self.ancestry = nil if self.ancestry.blank?
  end
end
