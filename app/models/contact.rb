# -*- encoding : utf-8 -*-
class Contact < ActiveRecord::Base
  attr_accessible :username, :phone, :email, :contact_message, :title
  validates_presence_of :username, :phone, :email, :contact_message, :title, :message => "不能空白喔"
  validates :phone, :presence => true,
            :length => {:minimum => 10, :message => "長度不正確"}

  validates_numericality_of :phone, :only_integer => true, :message => "請輸入數字"
  validates_format_of :email, :with => /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/, :message => "格式錯誤"
  validates_format_of :phone, :with => /^[0-9]{4}[0-9]{6}$/, :message => "格式錯誤"
end
