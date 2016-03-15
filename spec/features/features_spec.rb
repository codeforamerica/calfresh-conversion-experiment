require 'rails_helper'

RSpec.describe "the splash web form", type: :feature, js: true do
  it "has all the elements" do
    visit '/apply'
    select 'Yolo', from: 'County'
    fill_in 'Email address', with: 'dave@example.com'
    fill_in 'Phone number', with: '111-222-3333'
    click_button 'Start application'
  end

  it "contains 58 counties" do
    visit '/apply'
    expect(page).to have_selector('option', count: 58)
  end
end
