class Parent < ActiveRecord::Base
  has_secure_password
  belongs_to :family
  has_many :children, through: :family
  has_many :chores, through: :children
end
