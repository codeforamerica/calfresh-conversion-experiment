require 'rails_helper'

RSpec.describe "the splash web form", type: :feature do
  it "has all the elements" do
    visit '/apply'
    select 'Yolo', from: 'County'
    fill_in 'Email address', with: 'dave@example.com'
    fill_in 'Phone number', with: '111-222-3333'
    click_button 'Go to application'
  end
end
