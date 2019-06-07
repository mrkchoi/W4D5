# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user,
      username: "Calvin",
      password: ""
    )
  end

  # validations
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  
  # associations


  # class/instance methods
  it "makes sure that a user has a session token after initialize" do
    expect(user.session_token).to_not be_nil
  end
  it "makes sure that a user has a password digest after given a password" do
    expect(user.password_digest).to_not be_nil
  end

  describe '::find_by_credentials' do
    it "should find a user by their username & password" do
      user.password = "password"
      user.save
      expect(User.find_by_credentials("Calvin", "password")).to eq(user)
    end
  end
  
  describe '#reset_session_token!' do
    it "should reset a user's session token" do
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end
  end
  
  describe '#is_password?' do
    it "should validate a user's password" do
      user.password = "password"
      expect(user.is_password?("password")).to be(true)
    end
  end
  



  
end
