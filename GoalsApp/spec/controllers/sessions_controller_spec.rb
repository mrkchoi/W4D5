require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'should direct user to new session page' do
      get :new
      expect(response).to render_template('new')
    end
  end
  
  describe 'POST #create' do
    let(:user) {User.new(username: 'Calvin', password: 'password')}

    context 'with valid credentials' do
      it 'should login user' do
        user.save
        post :create, params: {user: {username: 'Calvin', password: 'password'}}
        expect(response).to redirect_to(users_url)
      end
    end

    context 'with invalid creds' do
      it 'should give user an error message' do
        user.save
        post :create, params: {user: {username: 'Calvin', password: 'pass'}}
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end
    end
  end
  
  describe 'DELETE #destroy' do
    let(:user) {User.new(username: 'Calvin', password: 'password')}

    it 'should logout user' do
      user.save
      post :create, params: {user: {username: 'Calvin', password: 'password'}}
      delete :destroy
      expect(response).to redirect_to(new_session_url)
      expect(session[:session_token]).to be_nil
    end
  end
end
