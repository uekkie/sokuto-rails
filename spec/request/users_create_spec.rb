require 'rails_helper'

describe 'POST /users', type: :request do
  context 'JSONでのリクエストは受け付けない' do
    it '406 not_acceptableを返す' do
      post '/users', params: {
          email:                 'test@gmail.com',
          password:              'hogehoge',
          password_confirmation: 'hogehoge'
      }, headers:            { 'ACCEPT' => 'application/json' }
      expect(response).to have_http_status(:not_acceptable)
    end
  end
end
