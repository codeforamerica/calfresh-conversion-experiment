require 'rails_helper'

describe UserSubmissionsController do
  describe "GET /apply" do
    before do
      get :new
    end

    it "is successful" do
      expect(response).to be_success
    end
  end

  describe "POST /apply" do
    before(:each) do
      allow(HTTParty).to receive(:post)
    end

    context "given valid submission data" do
      let(:time_now) { Time.zone.now }

      before do
        Timecop.freeze(time_now)

        post :create, { user_submission: { phone_number: "111-222-3333", email_address: "", county: "San Bernardino" } }
      end

      after do
        Timecop.return
      end

      it "adds a destination to the user submission" do
        submission = assigns[:user_submission]

        expect(submission.destination).to eq("c4")
      end

      it "sends the data to the Google Spreadsheet" do
        expect(HTTParty).to have_received(:post).
          with(
            "http://example.com/webhook/fakekey/",
            body: {
              timestamp: time_now,
              county: "San Bernardino",
              destination: "c4",
              phonenumber: "111-222-3333",
              email: ""
            }
          )
      end
    end
  end
end
