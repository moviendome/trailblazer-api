# frozen_string_literal: true

# == Schema Information
#
# Table name: expenses
#
#  id         :uuid             not null, primary key
#  user_id    :uuid
#  title      :citext
#  amount     :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

Fabricator :expense do
  title Faker::Food.dish
  amount Faker::Commerce.price
end
