# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :uuid             not null, primary key
#  email              :citext           not null
#  encrypted_password :string           not null
#  confirmed_at       :datetime
#  jti                :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

Fabricator :user do
  expenses(count: 2)
  email { Faker::Internet.email }
  password "123456"
  password_confirmation "123456"
  jti SecureRandom.uuid
end
