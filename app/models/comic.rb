class Comic < ApplicationRecord
 belongs_to :publisher
#  belongs_to :author
has_many :reviews
has_many :comments
has_many :users, through: :comments
mount_uploader :image_path, CommicImageUploader
  
  validates :title, {presence: true}
  validates :price, {presence: true}
end
