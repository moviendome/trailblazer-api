# frozen_string_literal: true

module User::Operations
  class Create < ApplicationOperation
    step Model(User, :new)
    step Contract::Build(constant: User::Contracts::Create)
    step Contract::Validate()
    step Contract::Persist()
  end
end
