class User
  # include MongoMapper::Document
  include Mongoid::Document

  validates :username, uniqueness: true

  field :username, type: String
  field :password_hash, type: String
  field :password_salt, type: String
  field :email, type: String
  field :role, type: Set, default: {}

  def auth password

    Digest::SHA2.hexdigest(password + self.password_salt) == self.password_hash

  end

end
