class User
  include MongoMapper::Document

  key :username, String
  key :password_hash, String
  key :password_salt, String
  key :email, String
  key :role, Set

end
