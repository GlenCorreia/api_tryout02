class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :title, uniqueness: true
  
  belongs_to :author
end
