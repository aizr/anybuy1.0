# -*- encoding : utf-8 -*-
class BidController < ApplicationController

  def biding
    if current_user == nil
      redirect_to new_session_path(:user)
    else
      @product = Product.find_by_id(params[:id])

      @user_id = current_user.id
      @user_money = current_user

     if @user_money.money.to_i > 0
       @biding = User.update_counters(current_user, :money => -1 ) && Product.update_counters(@product, :price => +1)

       @create = Bid.create!( :product_id => @product.id, :user_id => @user_id, :bindprice => @biding )

       respond_to do |format|
       format.html
       end

        else

      end

   end

  end

end
