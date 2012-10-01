# -*- coding: utf-8 -*-
class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type, :id, :created_at, :updated_at, :ship_date

  has_many :line_items, dependent: :destroy

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PaymentType.names
  # validates :pay_type, inclusion: ["現金", "クレジットカード", "注文書"]

  def add_line_items_form_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
