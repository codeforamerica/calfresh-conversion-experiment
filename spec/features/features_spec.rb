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

  it "shows the user a validation error if neither email address nor phone number are given" do
    visit '/apply'
    select 'Yolo', from: 'County'
    click_button 'Start application'
    expect(page.text).to include("Please enter either an email address or phone number to continue.")
  end
end
