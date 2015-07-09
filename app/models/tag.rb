class Tag < ActiveRecord::Base
  belongs_to :image
  belongs_to :user

  validates_presence_of :tag_label
  
end
