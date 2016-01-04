class Event < ActiveRecord::Base
  
  has_attachment  :title_image, accept: [:jpg, :png, :jpeg]
  has_attachments :regular_images, maximum: 50, accept: [:jpg, :png, :jpeg]

  validates :title_image, presence: true
  
  #extend FriendlyId
  #friendly_id :name, use: :slugged
  
  #def normalize_friendly_id(text)
    #text.to_slug.normalize(transliterations: :ukrainian).to_s
  #end
  
end
