# -*- encoding : utf-8 -*-
class Product < ActiveRecord::Base
  has_many :categoriess
  has_many :images, :dependent => :destroy
  has_many :bids
  has_many :users, :through => :bids

  accepts_nested_attributes_for :images
  attr_accessible :title, :description, :price, :images_attributes, :winner_id, :end_at, :categories_id, :primary_price
  validates_presence_of :title, :description, :price, :primary_price, :categories_id, :end_at
  validates_numericality_of :price, :primary_price, :only_integer => true
end