class Category < ActiveRecord::Base
  
  validates :nom, :length => {:within => 3..256}, :uniqueness => true
  has_and_belongs_to_many :recettes
end
