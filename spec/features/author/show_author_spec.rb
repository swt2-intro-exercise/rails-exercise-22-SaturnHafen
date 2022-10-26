require 'rails_helper'

describe "New author page", type: :feature do  
  it "should show the author's details" do
    @alan = FactoryBot.create :author

    visit author_path(@alan)
  end
end
