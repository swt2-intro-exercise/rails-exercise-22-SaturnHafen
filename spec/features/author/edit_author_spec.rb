require 'rails_helper'

describe "Edit author page", type: :feature do
  it "should exist at 'edit_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    @alan = FactoryBot.create :author

    visit edit_author_path(@alan)
  end
  
  it "should have text inputs for an author's first name, last name, and homepage" do
    @alan = FactoryBot.create :author

    visit edit_author_path(@alan)
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should show validation error" do
    @alan = FactoryBot.create :author

    visit edit_author_path(@alan)

    expect(page).to_not have_text('1 error prohibited this article from being saved:')
    expect(page).to_not have_text('Last name can\'t be blank')

    fill_in 'author[first_name]', with: 'Alan'
    fill_in 'author[last_name]', with: ''
    fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'

    click_button 'Update Author'

    expect(page).to have_text('1 error prohibited this article from being saved:')
    expect(page).to have_text('Last name can\'t be blank')
  end
end
