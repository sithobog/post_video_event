require 'rails_helper'

RSpec.describe Video, type: :model do
  it "is valid with a title, slug and description" do
    expect(FactoryGirl.build(:video)).to be_valid
  end

  it "is invalid without a title" do
    post = FactoryGirl.build(:video, title: nil)
    expect(post).not_to be_valid
  end

  it "is invalid without a slug" do
    post = FactoryGirl.build(:video, slug: nil)
    expect(post).not_to be_valid
  end

  it "is invalid without description" do
    post = FactoryGirl.build(:video, description: nil)
    expect(post).not_to be_valid
  end
end
