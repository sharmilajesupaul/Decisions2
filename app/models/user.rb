class User < ActiveRecord::Base
  include BCrypt
  has_many :weights
  has_many :tables, through: :weights

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def authenticate(typed_password)
    Password.new(self.password_digest) == typed_password
  end
end
