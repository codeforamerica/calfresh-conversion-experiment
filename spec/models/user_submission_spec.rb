require 'rails_helper'

RSpec.describe UserSubmission, type: :model do
  it "is valid if it contains a 10-digit phone number" do
    us = UserSubmission.new(
      county: "Placer",
      email_address: "",
      phone_number: "111-222-3333"
    )
    expect(us.valid?).to eq(true)
  end

  it "is valid if it contains an email address" do
    us = UserSubmission.new(
      county: "Placer",
      email_address: "dave@example.com",
      phone_number: ""
    )
    expect(us.valid?).to eq(true)
  end

  it "is invalid if it contains neither an email nor a phone number" do
    us = UserSubmission.new(
      county: "Placer",
      email_address: "",
      phone_number: ""
    )
    expect(us.valid?).to eq(false)
  end

  context "given an invalid phone number" do
    let(:user_submission) {
      UserSubmission.new(
        county: "Placer",
        phone_number: "1222333",
        email_address: ""
      )
    }

    it "gives a validation error for invalid phone #" do
      expect(user_submission.valid?).to eq(false)
      expect(user_submission.errors[:phone_number]).to eq(["Phone number needs to be ten digits (for example, 510-111-2222)"])
    end
  end
end
