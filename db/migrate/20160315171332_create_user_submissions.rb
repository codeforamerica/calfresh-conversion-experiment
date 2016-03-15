class CreateUserSubmissions < ActiveRecord::Migration
  def change
    create_table :user_submissions do |t|
      t.text :county
      t.text :email_address
      t.text :phone_number
      t.text :destination

      t.timestamps null: false
    end
  end
end
