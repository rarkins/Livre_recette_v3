class Comment < ActiveRecord::Base
  belongs_to :users
  belongs_to :recettes
  
  validates :content, :presence => true, :length => {:within => 6..1024}
  
end
