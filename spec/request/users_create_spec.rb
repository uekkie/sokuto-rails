require 'rails_helper'

RSpec.describe 'POST /users', type: :request do
  context 'ログインしていない場合' do
    it '401 Unauthorizedを返す' do
      post '/users', params: {
          email:                 'test@gmail.com',
          password:              'hogehoge',
          password_confirmation: 'hogehoge'
      }, headers:            { 'ACCEPT' => 'application/json' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end