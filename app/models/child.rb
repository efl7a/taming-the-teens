class Child < ActiveRecord::Base
  has_secure_password
  belongs_to :family
  has_many :parents, through: :family
  has_many :chores
end
