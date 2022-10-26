require 'rails_helper'

describe "index author page", type: :feature do  
  it "should show all the author's details" do
    @alan = FactoryBot.create :author

    visit authors_path

    expect(page).to have_text('Alan Turing')
    expect(page).to have_link 'http://wikipedia.de/Alan_Turing', href: 'http://wikipedia.de/Alan_Turing'
    expect(page).to have_link 'Details', href: author_path(@alan)
    expect(page).to have_link 'New', href: new_author_path
  end
end
