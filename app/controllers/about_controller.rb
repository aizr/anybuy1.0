# -*- encoding : utf-8 -*-
class AboutController < ApplicationController
  def message
    @messages = Message.order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
    @message = Message.new  
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to :action => :message }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def edit
    @message = Message.find(params[:id])
  
    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to :action => :message}
    end
  end
  
  def home
    @title = "關於我們"
  end

end
