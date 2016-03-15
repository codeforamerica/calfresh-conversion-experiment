class PhoneNumberValidator < ActiveModel::Validator
  def validate(record)
    if record.phone_number != "" and valid_digits_for_phone_number?(record.phone_number) == false
      record.errors[:phone_number] << "Phone number needs to be ten digits (for example, 510-111-2222)"
    end
  end

  private
  def valid_digits_for_phone_number?(phone_number_string)
    return false if !phone_number_string

    digits_only_string = phone_number_string.gsub(/\D+/, "")
    (digits_only_string.length == 10) or (digits_only_string.length == 11 and digits_only_string[0] == '1')
  end
end
