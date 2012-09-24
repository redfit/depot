# -*- coding: utf-8 -*-
class Product < ActiveRecord::Base
  before_destroy :ensure_not_referenced_by_any_line_item
  attr_accessible :description, :image_url, :price, :title

  has_many :line_items

  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true, length: {minimum: 10}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)$}i,
    message: 'はGIF、JPG、PNG画像のURLでなければなりません。'
  }

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, '品目が存在します。')
      return false
    end
  end
end
