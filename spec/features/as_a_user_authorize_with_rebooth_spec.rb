require 'rails_helper' 

feature "user authorize with redbooth" do 
  scenario "and receive a successful authentication message" do 
    visit '/'
    click_link 'Authorize with Redbooth'

    expect(page.body).to have_content 'Successfull authorization with Redbooth' 
  end
end
