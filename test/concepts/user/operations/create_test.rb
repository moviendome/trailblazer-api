# frozen_string_literal: true

require "test_helper"

module User::Operations
  class CreateTest < OperationTest
    it "should create an user" do
      op = User::Operations::Create.(params: {
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
      })

      assert op.success?
      assert op[:model].persisted?
    end

    it "should get an error when creating an invalid user" do
      op = User::Operations::Create.(params: {})

      assert op.failure?
      refute op[:model].persisted?
    end

    it "should get an error when creating an user with an invalid email" do
      op = User::Operations::Create.(params: {
        email: "invalid-email",
        password: "123456",
        password_confirmation: "123456"
      })

      assert op.failure?
      assert_equal "is in invalid format", op["contract.default"].errors.messages[:email].join
    end

    it "should get an error when creating an user with an existing email" do
      op = User::Operations::Create.(params: {
        email: "user@email.com",
        password: "123456",
        password_confirmation: "123456"
      })

      assert op.success?

      op = User::Operations::Create.(params: {
        email: "user@email.com",
        password: "123456",
        password_confirmation: "123456"
      })

      assert op.failure?
      assert_equal "Email already taked", op["contract.default"].errors.messages[:email].join
    end

    it "should get an error when creating an user password & password_confirmation don't match" do
      op = User::Operations::Create.(params: {
        email: Faker::Internet.email,
        password: "1234567",
        password_confirmation: "123456"
      })

      assert op.failure?
      assert_equal "must be equal to 1234567", op["contract.default"].errors.messages[:password_confirmation].join
    end

    it "should get an error when creating an user password is to short" do
      op = User::Operations::Create.(params: {
        email: Faker::Internet.email,
        password: "12345",
        password_confirmation: "12345"
      })

      assert op.failure?
      assert_equal "size cannot be less than 6", op["contract.default"].errors.messages[:password].join
    end
  end
end
