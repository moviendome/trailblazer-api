# frozen_string_literal: true

DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.clean_with(:truncation)

class OperationTest < Minitest::Spec
  include ActiveSupport::Testing::Assertions

  around do |tests|
    DatabaseCleaner.cleaning(&tests)
  end
end
