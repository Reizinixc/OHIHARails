class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :username
  end

  has_many :takes, :dependent => :destroy
  has_many :sections, :through => :takes

  has_many :teaches, :dependent => :destroy
  has_many :sections, :through => :teaches

  has_many :homeworks, :dependent => :destroy
  has_many :answers, :dependent => :destroy

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
                  :persistence_token,
                  :position

  validates :alt_email,
            :email,
            :lastname,
            :username,
            :name,
            :password_confirmation,
            :password, :presence => true
            #:type, :presence => true

  validates :username, :format => { :with => /((b\w+)|(g\w+)|(f\w+)){1,11}/ }, :uniqueness => true
  validates :password, :confirmation => true
  validates :email, :uniqueness => true
  #validates :position, :inclusion => { :in => %w[s t], :message => "User's type should be valid" }
end
