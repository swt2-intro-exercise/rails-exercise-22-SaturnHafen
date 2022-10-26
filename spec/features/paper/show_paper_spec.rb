require 'rails_helper'

describe "Show paper page", type: :feature do  
  it "should show the author's details" do
    @alan = FactoryBot.create :author
    @paper = FactoryBot.create :paper

    visit paper_path(@paper)

    expect(page).to have_text('Alan Turing')
  end
end
