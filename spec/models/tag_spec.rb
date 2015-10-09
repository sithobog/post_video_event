require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "is valid with a name and slug" do
    expect(FactoryGirl.build(:tag)).to be_valid
  end

  it "is invalid without a name" do
    tag = FactoryGirl.build(:tag, name: nil)
    expect(tag).not_to be_valid
  end

  it "is invalid without a slug" do
    tag = FactoryGirl.build(:tag, slug: nil)
    expect(tag).not_to be_valid
  end

  it "create tag only for unique name" do    
    FactoryGirl.create(:tag, name: "Name", slug: "Slug")
    expect{
      FactoryGirl.create(:tag, name: "Name", slug: "Another slug")
    }.to raise_exception(ActiveRecord::RecordInvalid, "Validation failed: Name has already been taken")
  end

  it "create tag only for unique slug" do    
    FactoryGirl.create(:tag, name: "Name", slug: "Slug")
    expect{
      FactoryGirl.create(:tag, name: "Another name", slug: "Slug")
    }.to raise_exception(ActiveRecord::RecordInvalid, "Validation failed: Slug has already been taken")
  end

end
