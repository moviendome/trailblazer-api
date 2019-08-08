# frozen_string_literal: true

require "reform"
require "reform/form/dry"
require "reform/form/coercion"
require "reform/form/validation/unique_validator"

class ApplicationForm < Reform::Form
  include Dry
end
