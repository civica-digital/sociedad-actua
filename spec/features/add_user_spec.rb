require 'rails_helper'
require 'faker'

describe 'Adding users' do
  it 'allow complete the organization profile' do
    visit registration_new_path

    email = Faker::Internet.email
    password = Faker::Internet.password(6)

    fill_in "user[email]", with: email
    fill_in "user[password]", with: password
    fill_in "user[password_confirmation]", with: password
    select "organization", from: "user[role]"

    click_on('Sign up')

    expect(page).to have_content('Completar registro')

  end

  it 'allow add user' do
    visit registration_new_path

    email = Faker::Internet.email
    password = Faker::Internet.password(6)

    fill_in "user[email]", with: email
    fill_in "user[password]", with: password
    fill_in "user[password_confirmation]", with: password
    select "organization", from: "user[role]"

    click_on('Sign up')

    expect(page).to have_content('Sign out')

  end

  it 'allow not add an existin user' do
    user = FactoryGirl.create(:user)
    user.save

    visit registration_path

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password

    fill_in "user[password_confirmation]", with: user.password
    select "organization", from: "user[role]"

    click_on('Sign up')

    expect(page).to have_content('Este email ya esta en uso')
  end
end