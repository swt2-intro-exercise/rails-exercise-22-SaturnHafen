require 'rails_helper'

describe "Edit paper page", type: :feature do
  it "should exist at 'edit_paper_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    @paper = FactoryBot.create :paper

    visit edit_paper_path(@paper)
  end
  
  it "should have select boxes for the author" do
    @alan = FactoryBot.create :author
    @paper = FactoryBot.create :paper

    visit edit_paper_path(@paper)
    expect(page).to have_select("paper_author_ids")
  end
end
