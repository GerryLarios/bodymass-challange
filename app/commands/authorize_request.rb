class AuthorizeRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @auth_token = headers['Authorization']
  end

  def call
    find_user
  end

  private

  def find_user
    decoded = decoded_auth_token
    decoded ? User.find(decoded[:user_id]) : nil
  end

  def decoded_auth_token
    JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    @auth_token.present? ? @auth_token.split(' ').last : nil 
  end

  def add_err
    errors.add(:token, 'Invalid Token')
  end
end
