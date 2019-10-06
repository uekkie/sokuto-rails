require 'rails_helper'

describe "Users", type: :system do

  before do
    driven_by :selenium_chrome_headless
  end

  let!(:user) { create(:user) }

  scenario "ログインに失敗すること" do
    visit root_path
    click_link 'ログイン'

    expect(current_path).to eq(new_user_session_path)

    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'failed-pass'

    click_button 'ログイン'

    expect(page).to have_content 'メールアドレスまたはパスワードが違います'
    expect(current_path).to eq(new_user_session_path)
  end

  scenario "ユーザーはログインができる" do
    visit root_path
    click_link 'ログイン'

    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password

    click_button 'ログイン'

    expect(page).to have_content 'ログインしました'
  end
end
