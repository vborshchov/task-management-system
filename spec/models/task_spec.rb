require 'rails_helper'

describe Task do
  it "is invalid without a title" do
    expect(FactoryGirl.build(:task, title: nil)).not_to be_valid
  end
  it "is invalid when priority is not a number" do
    expect(FactoryGirl.build(:task, priority: "a4f")).not_to be_valid
  end
  it "is valid if priority is not set" do
    expect(FactoryGirl.build(:task, priority: nil)).to be_valid
  end
  it "has due date in future" do
    expect(FactoryGirl.build(:task)).to be_valid
  end
  it "is valid if due date is not set" do
    expect(FactoryGirl.build(:task, due_date: nil)).to be_valid
  end
end