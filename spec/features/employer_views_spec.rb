require 'rails_helper'

RSpec.feature "Employer Views", type: :feature do
  let(:user) { create :user }
  let(:employer) { create :employer }
  let(:industry) { create :industry }
  let(:industry_other) { create :industry }

  background do
    # login_as user, scope: :user
    
    employer.industries << industry
    industry_other

    expect(Employer.count).to eq(1)
    expect(Industry.count).to eq(2)
    expect(Employer.last.industries).to include(industry)
  end
  
  def visit_employers
    visit '/'
    save_page 'home.html'
    
    expect(page).to have_content("Employers")
    click_on "Employers"
    save_page 'employers.html'
  end
  
  def remove_tag model, attribute, label
    find("##{attribute}-tags span.tag span", text: label).sibling('a').click
  end
  
  def add_tag model, attribute, label
    find("input##{model}_#{attribute}_tags_tag").send_keys(label)
    find('li.ui-menu-item .ui-menu-item-wrapper', text: label).click
  end
  
  scenario "Creating", js: true do
    visit_employers
    click_on 'Add New Employer'
    
    expect(page).to have_content('New Employer')
    
    fill_in 'Name', with: 'New Name'
    add_tag :employer, :industry, industry_other.name
    
    click_on 'Create Employer'
    
    employer = Employer.last
    expect(employer.name).to eq('New Name')
    expect(employer.industries).to include(industry_other)
    expect(employer.industries).to_not include(industry)
  end
  
  scenario "Viewing", js: true do
    visit_employers
    
    expect(page).to have_content("Employers")
    expect(page).to have_content("ADD NEW EMPLOYER")
    
    click_on employer.name
    
    expect(page).to have_content('Industries')
    
    within 'li' do
      expect(page).to have_content(industry.name)
    end
    
    expect(page).to have_content('Opportunities')
    expect(page).to have_content('Locations')
  end
  
  scenario "Updating", js: true do
    visit_employers

    click_on 'Edit'
    
    expect(page).to have_content('Editing Employer')
    expect(page).to have_content(industry.name)
    
    fill_in 'Name', with: 'New Name'
    remove_tag(:employer, :industry, industry.name)
    add_tag(:employer, :industry, industry_other.name)

    click_on 'Update Employer'
    
    employer.reload
    expect(employer.name).to eq('New Name')
    expect(employer.industries).to_not include(industry)
    expect(employer.industries).to include(industry_other)

    expect(page).to have_current_path(employer_path(employer.id))
  end
  
  scenario "Deleting", js: true do
    visit_employers
    
    click_on 'Delete'
    page.driver.browser.switch_to.alert.accept
    
    expect(page).to have_current_path(employers_path)
    expect(page).to have_content("Employer #{employer.name} was successfully deleted.")
    expect(Employer.count).to eq(0)
  end
end
