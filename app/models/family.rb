class Family < ActiveRecord::Base
  has_many :parents
  has_many :children
end
