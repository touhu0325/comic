class Author < ApplicationRecord
    has_many :comic
    validates :name, {presence: true}
end
