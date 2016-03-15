require 'rails_helper'

RSpec.describe UserSubmission, type: :model do
  it "is invalid if it contains neither an email nor a phone number" do
    us = UserSubmission.new(
      county: "Placer",
      email_address: "",
      phone_number: ""
    )
    expect(us.valid?).to eq(false)
  end
end
