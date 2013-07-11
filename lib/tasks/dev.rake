# -*- encoding : utf-8 -*-
namespace :dev do
  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear","db:drop","db:create","db:migrate"]
  task :rebuild => ["dev:build","db:seed"]

  desc "Add admin"
  task :setup => :environment do
    puts "Create Admin"
    user = User.new(:username => "管理員", :cname => "admin", :money => "99999", :phone => "0982000000", :birthday => "20130101", :address => "test",
                    :password => "11113333", :password_confirmation => "11113333", :email => "test@gmail.com", :nid => "1234567890")
    user.is_admin = true
    user.save!
    puts "Create Admin done!"
  end
end