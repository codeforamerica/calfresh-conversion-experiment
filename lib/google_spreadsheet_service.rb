class GoogleSpreadsheetService
  def self.save_user_submission(user_submission)
    HTTParty.post(
      zapier_webhook_url,
      body: {
        county: user_submission.county,
        destination: user_submission.destination,
        phonenumber: user_submission.phone_number,
        email: user_submission.email_address
      }
    )
  end

  private
  def self.zapier_webhook_url
    Rails.application.secrets.zapier_webhook_url
  end
end
