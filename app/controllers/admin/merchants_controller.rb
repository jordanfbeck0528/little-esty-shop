class Admin::MerchantsController < ApplicationController
  def index
    @admin_merchants = Merchant.all
  end

  def show
    @admin_merchant = Merchant.find(params[:id])
  end

  def edit
    @admin_merchant = Merchant.find(params[:id])
  end

  def update
    @admin_merchant = Merchant.find(params[:id])
    @admin_merchant.update(admin_merchant_params)
    @admin_merchant.save
    flash[:notice] = "The information has been successfully updated."
    redirect_to admin_merchant_path(@admin_merchant)
  end

  private
  def admin_merchant_params
    params.permit(:name)
  end
end