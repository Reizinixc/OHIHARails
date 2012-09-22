class User < ActiveRecord::Base
  
  has_many :section, :through => :takes
  has_many :section, :through => :ta
  has_many :section, :through => :teaches  
  acts_as_authentic do |c|
    c.login_field = :login
  end
  
  attr_accessible :alt_email, :crypted_password, :email, :last_login_at, :last_login_ip, :lastname, :login, :name, :password_salt, :persistence_token
  attr_accessible :password, :password_confirmation
  
  validates :name,
            :lastname,
            :email,
            :alt_email,
            :login,
            :password, :presence => true
   
   # A name and lastname must be a character
   # validates :name, :lastname, :format => { :with => /\w+/ }
   
   # A username for logining must be a character and <= 11 characters
   validates :login, :format => { :with => /\w{,11}/ }
   
   validates :email, :uniqueness => true
   
end