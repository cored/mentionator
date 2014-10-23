require 'rails_helper' 

feature 'user see tasks created on redbooth' do 
  scenario 'list of tasks' do 
    visit tasks_path

    expect(page.body).to have_css('h1', text: 'Tasks')
  end
end
