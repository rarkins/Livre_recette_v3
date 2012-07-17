class Recette < ActiveRecord::Base
  attr_accessible :accompagnement, :auteur, :cuisson, :ingredient, :instruction, :marinage, :note, :portion, :preparation, :source, :titre, :vin

  validates :accompagnement, :allow_blank => true, :length => {:within => 4..128}
  validates_numericality_of :auteur, :presence => true
  validates :cuisson, :allow_blank => true, :length => {:within => 4..32}

  validates :ingredient, :presence => true
  validates :instruction, :presence => true
  validates :marinage, :allow_blank => true, :length => {:within => 4..32}
  
  validates :portion, :allow_blank => true, :length => {:within => 4..32}
  
  validates :preparation, :length => {:within => 4..32}
  
  validates :source, :allow_blank => true, :length => {:within => 4..256}
  
  validates :titre, :length => {:within => 4..128}
  
  validates :vin, :allow_blank => true, :length => {:within => 4..32}
  
end