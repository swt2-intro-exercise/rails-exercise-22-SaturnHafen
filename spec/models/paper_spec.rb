require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should not accept malformed fields" do
    @paper = Paper.new({})
    expect(@paper).to_not be_valid

    @paper = Paper.new({:title => "This is an interesting paper"})
    expect(@paper).to_not be_valid

    @paper = Paper.new({:title => "This is an interesting paper", :venue => "Published online" })
    expect(@paper).to_not be_valid

    @paper = Paper.new({:title => "This is an interesting paper", :venue => "Published online", :year => "in the near future"})
    expect(@paper).to_not be_valid
  end
end
