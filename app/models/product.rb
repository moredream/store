class Product < ActiveRecord::Base
  attr_accessible :name, :price, :image, :crop_x, :crop_y, :crop_w, :crop_h
  validates_presence_of :name, :price

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  mount_uploader :image , ImageUploader
  after_update :crop_image
  
  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
