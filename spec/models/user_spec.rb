require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
  
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name). is_at_least(1) }
  
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email). is_at_least(3) }
  it { is_expected.to allow_value("user@bloccit.com").for(:email) }
  
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password). is_at_least(6) }
  
  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
    end
  end
  
  describe "invalid user" do
    let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
    let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }
    
    it "should be an invalid user due to a blank name" do
      expect(user_with_invalid_name).to_not be_valid
    end
    
     it "should be an invalid user due to a blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end
  
   describe "format user name" do
     let (:user_name_not_capitalized) { User.create!(name: "bloccit user", email: "user@bloccit.com", password: "password") }
     let (:user_first_name_not_capitalized) { User.create!(name: "bloccit User", email: "user2@bloccit.com", password: "password") }
     let (:user_last_name_not_capitalized) { User.create!(name: "Bloccit user", email: "user3@bloccit.com", password: "password") }
     let (:user_name_capitalized) { User.create!(name: "Bloccit User", email: "user4@bloccit.com", password: "password") }
     
      it "should capitalize both first and last names" do
        expect(user_name_not_capitalized.name).to eq("Bloccit User")
        expect(user_first_name_not_capitalized.name).to eq("Bloccit User")
        expect(user_last_name_not_capitalized.name).to eq("Bloccit User")
        expect(user_name_capitalized.name).to eq("Bloccit User")
      end
    end
    
end
