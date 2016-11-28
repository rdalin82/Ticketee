require 'rails_helper' 

RSpec.feature "Users can delete project" do 
  scenario "Successfully" do 
    FactoryGirl.create(:project, name: "Sublime Text 3") 
    login_as( FactoryGirl.create(:user, :admin) )
    visit "/" 
    click_link "Sublime Text 3" 
    click_link "Delete Project" 
    expect(page).to have_content "Project has been deleted." 
    expect(page.current_url).to eq projects_url
  end
end
