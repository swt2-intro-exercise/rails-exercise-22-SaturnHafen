require 'rails_helper'

describe "index paper page", type: :feature do  
  it "should show edit / delete links" do
    @paper = FactoryBot.create :paper

    visit papers_path

    expect(page).to have_link 'New paper', href: new_paper_path
    expect(page).to have_link 'Edit this paper', href: edit_paper_path(@paper)
    expect(page).to have_link 'Delete this paper', href: paper_path(@paper)
  end
  
  it "should delete a paper when the appropiate link is clicked" do
    @paper = FactoryBot.create :paper

    @old_count = Paper.count

    visit papers_path
    click_link 'Delete this paper'

    expect(@old_count).to equal Paper.count + 1
  end

  it "should not show papers with non-matching years" do
    @paper = FactoryBot.create :paper

    visit papers_path({ :year => 1951 })

    expect(page).to_not have_text("COMPUTING MACHINERY AND INTELLIGENCE")
  end
end