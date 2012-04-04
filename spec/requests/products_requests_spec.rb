require 'spec_helper'

describe "Products Requests" do
  context "GET index" do
    let!(:products) { [Fabricate(:product, :title => "Foo"), 
      Fabricate(:product, :title => "Bar")] }
    before(:each) do      
      visit "/products"
    end

    it "shows Products header" do
      page.should have_content("Products")
    end

    it "shows all of the products" do
      find_link("Foo").visible?
      find_link("Bar").visible?
    end

    it "creates a list of the products" do
      within ("li") do
        find_link("Foo").visible?
      end
    end
  end

  context "GET show" do 
    let!(:product) { Fabricate(:product, :id => 1, :title => "Foo") }

    it "shows product page" do
      visit "/products" 
      find_link("Foo").click
      current_path.should == product_path(product)
    end
  end
end