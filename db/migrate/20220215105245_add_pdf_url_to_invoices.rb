# frozen_string_literal: true

class AddPDFUrlToInvoices < ActiveRecord::Migration[7.0]
  def change
    change_table :invoices do |t|
      t.string :file_url
    end
  end
end
