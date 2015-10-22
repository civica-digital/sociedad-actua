require 'rails_helper'

RSpec.feature "AddNewCollaborators", type: :feature do
  it "Allow create one new collaborator" do

    signup_organization

    visit new_collaborator_path

    email = Faker::Internet.email
    name = Faker::Name.name
    description = Faker::Lorem.paragraph
    type = %w{Asesor(a) Voluntario(a) Periodista}.sample

    fill_in "collaborator[name]", with: name
    fill_in "collaborator[email]", with: email
    fill_in "collaborator[description]", with: description
    select  type, from: "collaborator[type_collaborator]"

    click_on "Create Collaborator"

    expect(page).to have_content("Excelente! Bienvenido #{type}, este es tu perfil público.")
  end
end
