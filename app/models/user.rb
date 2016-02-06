class User < ActiveRecord::Base
  include Clearance::User
  has_many :collections
  has_many :documents
end
