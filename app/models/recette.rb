class Recette < ActiveRecord::Base
  attr_accessible :accompagnement, :user_id, :cuisson, :ingredient, :instruction, :marinage, :note, :portion, :preparation, :source, :titre, :vin, :category_ids

  validates_numericality_of :user_id, :presence => true
  validates :cuisson, :allow_blank => true, :length => {:within => 3..32}

  validates :ingredient, :presence => true
  validates :instruction, :presence => true
  validates :marinage, :allow_blank => true, :length => {:within => 3..32}

  validates :portion, :allow_blank => true, :length => {:within => 3..32}

  validates :preparation, :length => {:within => 3..32}

  validates :source, :allow_blank => true, :length => {:within => 3..256}

  validates :titre, :length => {:within => 3..128}

  validates :vin, :allow_blank => true, :length => {:within => 3..256}
  
  validates :accompagnement, :allow_blank => true, :length => {:within => 3..1024}
  
  has_and_belongs_to_many :categories
  belongs_to :users

  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments, :allow_destroy => true

end