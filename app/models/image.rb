class Image < ActiveRecord::Base
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :images_users

  # has_many :tagged_users, class: "User", foreign_key: :user_id

  has_attached_file :attached_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :attached_image, :content_type => /\Aimage\/.*\Z/
end
