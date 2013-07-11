# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Categories.create([{ pname: '3c', ptitle: '3c數位' }, {pname: 'clothes', ptitle: '服飾配件與美妝'}, {pname: 'appliances', ptitle: '家電、視聽'},
                                {pname: 'games', ptitle: '電玩與玩具'}, {pname: 'pets', ptitle: '寵物用品與水族'}, {pname: 'sports_food', ptitle: '運動休閒與美食'}, {pname: 'books', ptitle: '書籍、文具、DVD'},
                                {pname: 'funiture', ptitle: '傢俱、寢具、收藏'}, {pname: 'cars_moto_department', ptitle: '汽機車百貨'}, {pname: 'ticket', ptitle: '禮卷'}])