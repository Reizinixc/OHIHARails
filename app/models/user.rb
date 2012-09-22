class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :username
  end

  def to_param
    username
  end

  attr_accessible :alt_email,
                  :username,
                  :password,
                  :password_confirmation,
                  :crypted_password,
                  :email,
                  :last_login_at,
                  :last_login_ip,
                  :name,
                  :lastname,
                  :password_salt,
                  :persistence_token

  validates :alt_email,
            :email,
            :lastname,
            :username,
            :name,
            :password_confirmation,
            :password, :presence => true

  validates :username, :format => { :with => /((b\w+)|(g\w+)|(f\w+)){1,11}/ }
  validates :password, :confirmation => true
  validates :email, :uniqueness => true
end
