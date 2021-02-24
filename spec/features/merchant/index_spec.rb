require 'rails_helper'

RSpec.describe 'As a Merchant', type: :feature do
  describe 'When i visit merchant dashboard' do
    it 'list the name of my merchant' do
      @merchant = Merchant.create!(name: "Lizzy")

      visit merchant_dashboard_index_path(@merchant)
      expect(page).to have_content(@merchant.name)
    end

    # it 'Then I see link to my merchant items index (/merchant/merchant_id/items))' do
    #   visit merchant_dashboard_index_path(@merchant)
    #
    #   expect(page).to have_content('Merchant Items Index')
    #   expect(page).to have_link(href: merchant_items_path(@merchant))
    #
    #   expect(page).to have_content('Merchant Invoices Index')
    #   expect(page).to have_link(href: merchant_invoices_path(@merchant))
    # end
  end
end
