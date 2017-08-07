class User
  include MongoMapper::Document

  validates :username, uniqueness: true

  key :username, String
  key :password_hash, String
  key :password_salt, String
  key :email, String
  key :role, Set

  def auth password

    Digest::SHA2.hexdigest(password + @password_salt) == @password_hash

  end

end
