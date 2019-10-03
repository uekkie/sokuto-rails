require "rails_helper"

describe "質問", type: :request do
  it "denies access to questions#new" do
    get new_loggedin_question_path
    expect(response).to redirect_to new_user_session_url
  end
end

Spec.describe "質問", type: :request do
  it "質問を作成したら、質問のページがひらく" do
    # get new_loggedin_question_path
    get '/loggedin/questions/new'
    expect(response).to eq have_http_status(302)
    # expect(response).to render_template(:new)
    # expect(current_path).to eq new_user_session

    # post loggedin_questions_path, params: { title: "Please tell me ...", content: "Do you ooo ?" }
    #
    # expect(response).to redirect_to(question_path(:question))
    # follow_redirect!
    #
    # expect(current_path).to eq question_path
    # expect(response.body).to include("作成しました")
  end
end