require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it '1 should create valid user' do
      user = User.create(
        last_name: "abc",
        first_name: "def",
        email: "aaa@aaa.com",
        password: "12345",
        password_confirmation: "12345"
        )
      expect(user).to be_valid
    end

    it '2 should have password and password confirmation' do
      user = User.create(
        last_name: "abc",
        first_name: "def",
        email: "abc@abc.com",
        password: "123",
        password_confirmation: "321"
        )
      expect(user).to_not be_valid
    end

    it '3 should not save without unique email' do
      user = User.create(
        last_name: "abc",
        first_name: "def",
        email: "abc@abc.com",
        password_digest: "123"
        )
      user2 = User.create(
        last_name: "abc",
        first_name: "def",
        email: "ABC@abc.com",
        password_digest: "123"
        )
      expect(user2).to_not be_valid
    end

    it '4 should have matching password and password confirmation' do
      user = User.create(
        last_name: "abc",
        first_name: "def",
        email: "abc@abc.com",
        password: "12345",
        password_confirmation: "123"
        )
      expect(user.password).to_not be_equal(user.password_confirmation)
    end
    
    it '5 should have a password with a minimum length of 3' do
      user = User.create(
        last_name: "abc",
        first_name: "def",
        email: "abc@abc.com",
        password: "12",
        password_confirmation: "12"
        )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it '6 check if user input password match in database' do
    user = User.create(
      last_name: "abc",
      first_name: "def",
      email: "abc@abc.com",
      password: "12345",
      password_confirmation: "12345"
      )
    authenticate = User.authenticate_with_credentials(user.email, user.password)
    expect(authenticate).to_not be_valid
    end
  end
end
