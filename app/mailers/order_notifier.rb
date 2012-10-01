# -*- coding: utf-8 -*-
class OrderNotifier < ActionMailer::Base
  default from: "Sam Ruby <depot@example.com>", :charset => 'ISO-2022-JP'

  def error_occured(error)
    @error = error
    mail to: "abc@xmail.com", subject: "Depot App Error Incident"
  end
  def received(order)
    @order = order

    mail to: order.email, subject: 'Pragmatic ストア 注文確認'
  end

  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Pragmatic ストア 発送しました'
  end
end
