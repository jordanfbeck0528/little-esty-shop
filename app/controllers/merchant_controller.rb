class MerchantController < ApplicationController
  def dashboard
    @merchant = Merchant.find(params[:id])
    # @top_five_merchants = Merchant.top_five
  end
end
