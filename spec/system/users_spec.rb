require 'rails_helper'

RSpec.feature "Users", type: :system do

  given(:user) {create(:user)}

  scenario "ユーザーはログインができる" do
    visit root_path
    click_link 'ログイン'

    expect(current_path).to eq(new_user_session_path)

    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'faild-pass'

    click_button 'ログイン'

    expect(page).to have_content 'Email もしくはパスワードが不正です。'

    expect(current_path).to eq(new_user_session_path)

    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password

    click_button 'ログイン'

    expect(page).to have_content 'ログインしました'
  end
end
