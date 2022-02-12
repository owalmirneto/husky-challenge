# frozen_string_literal: true

class Invoice < ApplicationRecord
  validates :invoice_number, presence: true
  validates :invoice_date, presence: true
  validates :total_amount_due, presence: true
  validates :customer_name, presence: true
  validates :emails, presence: true
end
