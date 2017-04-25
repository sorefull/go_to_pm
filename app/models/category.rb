# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  has_many :posts, foreign_key: "parent_id", dependent: :destroy

  validates :title, presence: true

  scope :roots, -> { where(parent_id: nil) }

  def parent_title
    parent&.title
  end

  def has_parent?
    parent.present?
  end

  def has_children?
    children.exists?
  end

  def has_posts?
    posts.exists?
  end

  def empty?
    !has_children? && !has_posts?
  end
end
