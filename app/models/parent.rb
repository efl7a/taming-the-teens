class Parent < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :password, on: :create
  belongs_to :family
  has_many :children, through: :family
  has_many :chores, through: :children
end
