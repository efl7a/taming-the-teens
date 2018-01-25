class Chore < ActiveRecord::Base
  validates_presence_of :child_id, :parent_id, :name, on: :create
  belongs_to :child
  belongs_to :parent
end
