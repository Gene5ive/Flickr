class Tag < ActiveRecord::Base
  belongs_to :image

  validates_presence_of :tag_label
end
