class User < ActiveRecord::Base
  has_many :listings
  has_many :listings, :through => :resources
  has_many :resources
  has_many :searches

  validates_presence_of :name, :nickname, :email, :password
  validates_uniqueness_of :nickname, :email
  

end
