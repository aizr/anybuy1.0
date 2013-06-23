# -*- encoding : utf-8 -*-
class Image < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image, :styles => { :medium => "200x200>",
                                          :thumb => "100x100>"
                                                       },
        :url => "/uploads/:id/:style/:basename.:extension",
        :path => ":rails_root/public/uploads/:id/:style/:basename.:extension"
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes, :message => "圖片大小超過5Mb"
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png'], :message => "格式錯誤"  
  attr_accessible :image
end
