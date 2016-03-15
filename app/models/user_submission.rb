class UserSubmission < ActiveRecord::Base
  validates_with UserSubmissionValidator
  validates_with PhoneNumberValidator
end
