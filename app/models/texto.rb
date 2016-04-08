class Texto < ActiveRecord::Base
  has_attached_file :image, styles: { original: '1259x624>', medium: '200x200>', thumb: '48x48>' }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  has_attached_file :second_image, styles: { original: '1259x624>', medium: '200x200>', thumb: '48x48>' }
  validates_attachment_content_type :second_image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
