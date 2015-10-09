require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with a title, address and started_at date" do
    expect(FactoryGirl.build(:event)).to be_valid
  end

  it "is invalid without a title" do
    post = FactoryGirl.build(:event, title: nil)
    expect(post).not_to be_valid
  end

  it "is invalid without a address" do
    post = FactoryGirl.build(:event, address: nil)
    expect(post).not_to be_valid
  end

  it "is invalid without started_at" do
    post = FactoryGirl.build(:event, started_at: nil)
    expect(post).not_to be_valid
  end
end
