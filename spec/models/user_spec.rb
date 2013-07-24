require 'spec_helper'

describe User do
  it "validates" do
    user = build :user
    expect(user).to be_valid
  end

  it "requires email presence" do
    user = build :user, email: nil
    expect(user).to be_invalid
  end

  it "requires email uniqueness" do
    create :user, email: 'bob@bob.com'
    user = build :user, email: 'bob@bob.com'
    expect(user).to be_invalid
  end
end
