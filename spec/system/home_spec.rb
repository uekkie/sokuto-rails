require 'rails_helper'


describe 'ホームページ', type: :system do
  let!(:user) { create(:user) }

  before do
    driven_by :selenium_chrome_headless
  end

  it 'タイトルがあること' do
    visit root_url
    expect(page).to have_content 'Spark Hackers'
  end

  it '人気、今週、今月のタブが存在すること' do
    visit root_url
    expect(page).to have_content '人気'
    expect(page).to have_content '今週'
    expect(page).to have_content '今月'
  end

  it 'ログインしていれば「質問する」ボタンがあること' do
    sign_in user
    visit root_url
    expect(page).to have_content '質問する'
  end
end