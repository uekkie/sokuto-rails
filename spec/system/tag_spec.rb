require 'rails_helper'

RSpec.feature "Tags", type: :system do
  it '人気、名前、新規のタブが存在すること' do
    visit tags_url

    expect(page).to have_content '人気'
    expect(page).to have_content '名前'
    expect(page).to have_content '新規'
  end

  let!(:question) {
    user = create(:user)
    create(:question, user: user, tag_list: ['働き方'])
  }

  it '質問についたタグがタグ一覧に追加される' do
    visit tags_path
    expect(page).to have_content '働き方 × 1'
  end

  it '質問の詳細ページにタグがある' do
    visit question_path(question)
    expect(page).to have_content '働き方'
  end

  it 'おなじタグをつけたときはタグ一覧の数が増える' do
    user = create(:user)
    create(:question, user: user, tag_list: ['働き方'])
    visit tags_path
    expect(page).to have_content '働き方 × 2'
  end
end