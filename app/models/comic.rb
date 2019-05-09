class Comic < ApplicationRecord
 belongs_to :publisher
#  belongs_to :author
has_many :reviews
  
  validates :title, {presence: true}
  validates :price, {presence: true}
end
