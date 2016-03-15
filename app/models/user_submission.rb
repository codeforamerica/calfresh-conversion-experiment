class UserSubmission < ActiveRecord::Base
  validates_with UserSubmissionValidator
end
