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
  pending "add some examples to (or delete) #{__FILE__}"
  # validations
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  
  # associations


  # class/instance methods
  describe '::find_by_credentials' do
    it "should find a user by their username & password" do

    end
  end
  
  describe '#ensure_session_token' do
    it "makes sure that a user has a session token after initialize" do

    end
  end
  
  describe '#reset_session_token!' do
    it "should reset a user's session token" do

    end
  end
  
  describe '#is_password?' do
    it "should validate a user's password" do

    end
  end
  
  describe '#password=' do
    context 'with invalid params' do
      it "should not assign a password digest for a user" do
        let(:user) { User.new(username: 'calvin', password: 'password') }
        
      end
    end
    
    context 'with valid params' do
      it "should assign a password digest for a user" do
        
      end
    end
  end



  
end
