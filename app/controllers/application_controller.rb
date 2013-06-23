# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
http_basic_authenticate_with :name => "admin", :password => "123"  
protect_from_forgery
end
