# frozen_string_literal: true

class ExpenseRepresenter < ApplicationJsonRepresenter
  property :id
  property :title
  property :amount, type: Float
  property :created_at
  property :updated_at
end
