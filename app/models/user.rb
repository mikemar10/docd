class User < ActiveRecord::Base
  include Clearance::User
  has_one :library
  has_many :collections
  has_many :documents, through: :library
end
