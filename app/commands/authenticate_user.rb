class AuthenticateUser
  prepend SimpleCommand
  
  def initialize(email, password)
    @email = email
    @password = password
    @user = find_user
  end

  def call
    @user ? encode : add_err 
  end

  private 
  
  def encode
    auth_user ? JsonWebToken.encode(user_id: @user.id) : add_err 
  end
  
  def auth_user
    @user.authenticate(@password)
  end

  def find_user
    User.find_by_email(@email) 
  end

  def add_err
    errors.add(:user_authentication, 'invalid credentials')
  end
end
