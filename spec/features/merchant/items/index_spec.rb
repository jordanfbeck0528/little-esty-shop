require 'rails_helper'

describe 'As a merchant' do
  describe "When I visit my merchant items index page ('merchant/merchant_id/items')" do
    before :each do
      @merchant_1 = Merchant.create!(name: 'One')
      @merchant_2 = Merchant.create!(name: 'Two')
      @item_1 = @merchant_1.items.create!(name: 'Item 1', description: 'One description', unit_price: 10)
      @item_2 = @merchant_1.items.create!(name: 'Item 2', description: 'Two Description', unit_price: 20)
      @item_3 = @merchant_2.items.create!(name: 'Item 3', description: 'Three Description', unit_price: 30)
      @item_4 = @merchant_1.items.create!(name: 'Item 4', description: 'Four Description', unit_price: 20, status: 1)
      @item_5 = @merchant_1.items.create!(name: 'Item 5', description: 'Five Description', unit_price: 30, status: 1)

      visit merchant_items_path(@merchant_1)

    end

    # it 'I see a list of the names of all of my items' do
    #   within '.merchant-items' do
    #     expect(page).to have_content(@item_1.name)
    #     expect(page).to have_content(@item_2.name)
    #   end
    # end
    #
    # it 'I do not see items for any other merchant' do
    #   within '.merchant-items' do
    #     expect(page).to_not have_content(@item_3.name)
    #   end
    # end

    describe 'When I click on the name of an item' do
      it "Then I am taken to that merchant's item's show page (/merchant/merchant_id/items/item_id)" do
        visit merchant_items_path(@merchant_1)

        expect(page).to have_link(@item_1.name)
        expect(page).to have_link(@item_2.name)

        click_link(@item_1.name)

        expect(current_path).to eq(merchant_item_path(@merchant_1.id, @item_1.id))
      end
    end

    it 'my page has sections for enabled and disabled items and each item has a button that changes its status' do
      item = Item.first

      visit merchant_items_path(@merchant_1)

      within('#items-disabled') do
        expect(page).to have_content(item.name)
        click_on(id: "btn-enable-#{item.id}")
        expect(current_path).to eq(merchant_items_path(@merchant_1))
      end

      within('#items-enabled') do
        expect(page).to have_content(item.name)
      end
    end

    it 'has a link to create new item and when i click on create, a new item is created it is shown on the index page' do
      visit merchant_items_path(@merchant_1)


      click_link('New Item')


      expect(current_path).to eq(new_merchant_item_path(@merchant_1))

      fill_in 'item_name', with: 'New Item'
      fill_in 'item_unit_price', with: 120
      fill_in 'item_description', with: 'New item description yay!'

      click_button 'Submit'
      save_and_open_page


      expect(current_path).to eq(merchant_items_path(@merchant_1))
      expect(page).to have_content("Disabled Items")
      expect(page).to have_content('New Item')
    end

      visit merchant_items_path(all_birds.id)

      it "shows the top 5 most popular items by total revenue" do
        visit merchant_items_path(@merchant_1.id)

          within("#top_5") do
            expect(@item_1.name).to appear_before(@item_2.name)
            expect(@item_2.name).to appear_before(@item_3.name)
            expect(@item_3.name).to appear_before(@item_8.name)
            expect(@item_8.name).to appear_before(@item_4.name)

            expect(page).to have_no_content(@item_7.name)
          end
        end

  end
end
