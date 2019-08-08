# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.belongs_to :user, type: :uuid, index: true
      t.citext :title
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps null: false
    end
  end
end
