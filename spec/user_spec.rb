require "rails_helper"
require "spec_helper"

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "Should save the user" do
      @user = User.create(
        :first_name => 'A',
        :last_name => 'B',
        :email => 'abc@gmail.com',
        :password => 'abc',
        :password_confirmation => 'abc'
      )
      expect(@user).to be_valid
    end

    it "Should have password" do
      @user = User.create(
        :first_name => 'A',
        :last_name => 'B',
        :email => 'abc@gmail.com',
        :password => nil,
        :password_confirmation => 'abc')
      expect(@user).to be_invalid
    end

    it "Should have password confirmation" do
      @user = User.create(
        :first_name => 'A',
        :last_name => 'B',
        :email => 'abc@gmail.com',
        :password => 'abc',
        :password_confirmation => nil)
      expect(@user).to be_invalid
      @user.password_confirmation = 'abc'
      expect(@user).to be_valid
    end

    it "Should have unique and case insensitive emails" do
      @user = User.create(
        :first_name => 'A',
        :last_name => 'B',
        :email => 'ABC@gmail.com',
        :password => 'abc',
        :password_confirmation => 'abc')
      @user2 = User.create(
        :first_name => 'A',
        :last_name => 'B',
        :email => 'abc@gmail.com',
        :password => 'abc',
        :password_confirmation => 'abc')
      expect(@user2).to be_invalid
    end

    it "Should have email, first and last name" do
      @user = User.create(
        :first_name => nil,
        :last_name => nil,
        :email => nil,
        :password => 'abc',
        :password_confirmation => 'abc')
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("First name can't be blank")
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end 
  end

  describe '.authenticate_with_credentials' do
  end
end