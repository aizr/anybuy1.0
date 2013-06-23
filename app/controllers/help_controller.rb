# -*- encoding : utf-8 -*-
class HelpController < ApplicationController
  def contact_index
    if current_user && current_user.is_admin
      @contacts = Contact.order("created_at DESC").page(params[:page]).per(5)
    else
      respond_to do |format|
        format.html { redirect_to :action => :contact }
      end
    end
  end

  def contact_show
    if current_user && current_user.is_admin
      @contact = Contact.find(params[:id])
    else
      respond_to do |format|
        format.html { redirect_to :action => :contact }
      end
    end
  end

  def contact
    @title = "聯絡我們"
    @contact = Contact.new  
    respond_to do |format|
      format.html
    end
  end

  def contact_create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to :action => :contact }
      else
        format.html { render action: "contact" }
      end
    end
  end
  
  def contact_destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to :action => :contact}
    end
  end

  def tiro
    @title = "新手教學"
  end

  def question
    @title = "常見問題"
  end

end
