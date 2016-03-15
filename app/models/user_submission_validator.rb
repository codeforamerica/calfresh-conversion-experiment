class UserSubmissionValidator < ActiveModel::Validator
  def validate(record)
    if record.phone_number.empty? and record.email_address.empty?
      record.errors.add(:base, "Please enter either an email address or phone number to continue.")
    end
  end
end
