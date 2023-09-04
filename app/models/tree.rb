class Tree < ApplicationRecord
  has_many :nodes, dependent: :destroy

end
