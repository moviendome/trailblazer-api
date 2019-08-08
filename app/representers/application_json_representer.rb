# frozen_string_literal: true

require "representable/coercion"

class ApplicationJsonRepresenter < Representable::Decorator
  include Representable::JSON
  include Representable::Coercion
end
