module Account

  module AccountHelper
    def signup_organization
      visit registration_new_path

      user = {
        :email => Faker::Internet.email,
        :password => Faker::Internet.password(6, 20)
      }

      fill_in "user[email]", with: user[:email]
      fill_in "user[password]", with: user[:password]
      fill_in "user[password_confirmation]", with: user[:password]
      select "organization", from: "user[role]"

      click_on('Sign up')

    end
  end

end