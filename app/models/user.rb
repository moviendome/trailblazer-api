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


class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :expenses, dependent: :destroy

  def jwt_payload
    super.merge("user_id": id, "email": email)
  end
end
