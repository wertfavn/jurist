class Event < ActiveRecord::Base
  
  has_attachment  :title_image, accept: [:jpg, :png, :jpeg]
  has_attachments :regular_images, maximum: 50, accept: [:jpg, :png, :jpeg]

  validates :title_image, presence: true
  validates :name, presence: true
end
