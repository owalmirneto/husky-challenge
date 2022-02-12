# frozen_string_literal: true

class InvoicesQuery < ApplicationQuery
  def init_relation
    @relation = Invoice.all
  end

  def default_ordination
    @relation = @relation.order(created_at: :desc)

    self
  end

  def search(term)
    search_ilike_for([:invoice_number, :emails, :customer_name], term)
  end
end
