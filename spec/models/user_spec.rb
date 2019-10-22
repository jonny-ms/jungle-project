require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    user = User.create({
      first_name: 'Jonny',
      last_name: 'Boi',
      email: 'j.boi@gmail.com',
      password: 'asdfjkl',
      password_confirmation: 'asdfjkl'
    })
    @users = User.all
    p @users
  
    
    it 'should require that password and password confirmation fields are not blank' do
  
      @user = User.create({
        first_name: 'Jonny',
        last_name: 'Boi',
        email: 'j.dawg@gmail.com',
        password: nil,
        password_confirmation: nil
      })
      
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
      
    end
    
    it 'should not validate if a password confirmation doesn\'t match password' do
      
      @user = User.create({
        first_name: 'Jonny',
        last_name: 'Boi',
        email: 'j.dawg@gmail.com',
        password: 'password',
        password_confirmation: 'test'
      })
      
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      
    end
  
    it 'should validate with unique emails NOT case sensitive' do
  
      user2 = User.create({
        first_name: 'Jarod',
        last_name: 'Boi',
        email: 'J.Boi@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      })
  
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")    
    end
    
    it 'should not validate without email' do
  
      @user = User.create({
        first_name: 'Jonny',
        last_name: 'Boi',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      })
      
      expect(@user).to_not be_valid 
      expect(@user.errors.full_messages).to include("Email can't be blank")
      
    end
    
    it 'should not validate without first name' do
  
      @user = User.create({
        first_name: nil,
        last_name: 'Boi',
        email: 'j.dawg@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      })
      
      expect(@user).to_not be_valid 
      expect(@user.errors.full_messages).to include("First name can't be blank")
      
    end
  
    it 'should not validate without last name' do
  
      @user = User.create({
        first_name: 'Jonny',
        last_name: nil,
        email: 'j.dawg@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      })
      
      expect(@user).to_not be_valid 
      expect(@user.errors.full_messages).to include("Last name can't be blank")
  
    end
  
    it 'should not validate if password is too short' do
  
      @user = User.create({
        first_name: 'Jonny',
        last_name: 'Boi',
        email: 'j.dawg@gmail.com',
        password: 'short',
        password_confirmation: 'short'
      })
      
      expect(@user).to_not be_valid 
      # expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end

  # describe '.authenticate_with_credentials' do
    # examples for this class method here
  # end
end
