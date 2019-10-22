class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  # def authenticate_with_credentials(email, password)
  #   @user = self.find_by_email(email)
  #   if @user.password == password
  #     return @user
  #   else
  #     return nil
  #   end
  # end
end
