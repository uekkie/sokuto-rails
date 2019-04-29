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
    #
    # scenario "ユーザーはログアウトができる" do
    #   sign_in user
    #   visit root_path
    #   expect(page).to have_content "ログアウト"
    #
    #   click_link 'ログアウト'
    #
    #   expect(page).to have_content 'ログアウトしました'
    #
    #   expect(current_path).to eq(root_path)
    # end
    #
    #
    # scenario "ユーザーはあたらしい投稿を作成することができる" do
    #   sign_in user
    #   visit new_user_item_path(user)
    #
    #   click_link '投稿する'
    #   fill_in 'item_title', with: 'Test Item'
    #   fill_in 'item_tag', with: 'Ruby,Rails'
    #   fill_in 'item_body', with: 'Trying out Capybara'
    #
    #   expect {
    #     click_button '投稿する'
    #   }.to change(user.items, :count).by(1)
    #
    #   expect(page).to have_content '作成しました'
    #   expect(page).to have_content 'Test Item'
    #   expect(page).to have_content 'Ruby'
    #   expect(page).to have_content 'Rails'
    #   expect(page).to have_content 'Trying out Capybara'
    # end

end
