require 'rails_helper'
RSpec.feature "AddOrganizationToInvestor", type: :feature do
  it "Afther Sing in investor send to edit profile" do

    signup_investor
    expect(page).to have_content "¡Genial! Te has registrado a Sociedad Actúa. Ahora completa tu perfil de usuario."

  end

  it "Allow add organization to investor" do

    

    org=create :organization
    signup_investor
    email = Faker::Internet.email
    name = Faker::Name.name
    zipcode = Faker::Address.zip
    type = %w{Empresa Gobierno}.sample
    #org_name = first('#investor_organization option').text

    fill_in "investor[name]", with: name
    fill_in "investor[email]", with: email
    fill_in "investor[zipcode]", with: zipcode
    select  type, from: "investor_type_investor"
    select  org.name, from: "investor_organization"
    click_on('Guardar inversionista')
    save_and_open_page

    expect(page).to have_content "Tu información ha sido actualizada."
  end  


end




