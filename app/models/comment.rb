class Comment < ActiveRecord::Base
  attr_accessible :content, :recette_id, :user_id
  belongs_to :users
  belongs_to :recettes
end
