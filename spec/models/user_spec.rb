require 'rails_helper'

describe User do
  it "returns a user's full name as a string" do
    user = FactoryGirl.create(:user, first_name: "Foo", last_name: "Bar")
    expect(user.full_name).to eq("Foo Bar")
  end
end