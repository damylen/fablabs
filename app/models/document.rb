class Document < ActiveRecord::Base
  belongs_to :project

  has_attached_file :image,
                    :styles => { :large => "1200x1200>",
                                 :medium => "640x640>",
                                 :thumb => "250x250>" }

  validates :image, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /bmp\Z/]
  validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 15.megabytes



end