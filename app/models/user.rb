# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
    has_many :bids
    has_many :products,  :through => :bids

    def is_admin?
	is_admin
    end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :username, :cname, :phone, :birthday, :nid, :address, :terms_of_service
  validates_presence_of :email, :password, :password_confirmation, :username, :cname, :phone, :birthday, :nid, :address, :message => "不能空白喔"
  #validates_confirmation_of :password
  validates_acceptance_of :terms_of_service, :message => "請勾選"
  validates :username, :cname, :presence => true,
	    :length => {:minimum => 2, :maximum => 10, :message => "長度不正確"}
	    
  validates :password, :password_confirmation, :presence => true,
	    :length => {:minimum => 6, :message => "最少6個字"}
	    
  validates :phone, :nid, :presence => true, 
	    :length => {:minimum => 10, :message => "最少10個字"}
	    
  validates_numericality_of :phone, :only_integer => true , :message => "請輸入數字"
  validates_format_of :email, :with => /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/, :message => "格式錯誤"
  validates_format_of :phone, :with => /^[0-9]{4}[0-9]{6}$/, :message => "格式錯誤"

end
