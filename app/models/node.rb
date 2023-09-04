class Node < ApplicationRecord
  belongs_to :tree
  belongs_to :parent, class_name: 'Node', optional: true
  has_many :children, class_name: 'Node', foreign_key: 'parent_id'

  validates :label, presence: true
end
