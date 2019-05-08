require 'rails_helper'

RSpec.feature "Users", type: :system do

  let!(:user) { create(:user) }

  scenario "ユーザーはログインができる" do
    visit root_path
    click_link 'ログイン'

    expect(current_path).to eq(new_user_session_path)

    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'failed-pass'

    click_button 'ログイン'

    expect(page).to have_content 'メールアドレス もしくはパスワードが不正です。'

    expect(current_path).to eq(new_user_session_path)

    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password

    click_button 'ログイン'

    expect(page).to have_content 'ログインしました'
  end
end
