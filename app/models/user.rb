class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 # Setup accessible (or protected) attributes for your model

 has_many :images, dependent: :destroy
 has_many :comments, dependent: :destroy
 has_many :tags

 # has_many :tagged_images, class: "Image", foreign_key: :image_id

 validates_presence_of :username

 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
 validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
