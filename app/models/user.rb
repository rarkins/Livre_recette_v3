class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :secure_validatable

  has_many :recettes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
end
