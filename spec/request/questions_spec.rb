require "rails_helper"

describe "質問", type: :request do
  it "denies access to questions#new" do
    get new_loggedin_question_path
    expect(response).to redirect_to new_user_session_url
  end
end