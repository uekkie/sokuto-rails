require 'rails_helper'

describe "Tags", type: :system do
  it '人気、名前、新規のタブが存在すること' do
    visit tags_url

    expect(page).to have_content '人気'
    expect(page).to have_content '名前'
    expect(page).to have_content '新規'
  end

  let!(:user) {
    user = create(:user)
  }

  it '質問についたタグがタグ一覧に追加される' do
    create(:question, user: user, tag_list: ['Google', 'Yahoo'])
    visit tags_path
    expect(page).to have_content 'Google × 1'
    expect(page).to have_content 'Yahoo × 1'
  end

  it '質問の詳細ページにタグがある' do
    question = create(:question, user: user, tag_list: ['Google', 'Yahoo'])
    visit question_path(question)
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Yahoo'
  end

  it 'おなじタグをつけたときはタグ一覧の数が増える' do
    create(:question, user: user, tag_list: ['働き方'])
    create(:question, user: user, tag_list: ['働き方'])
    visit tags_path
    expect(page).to have_content '働き方 × 2'
  end

  it 'タグのアルファベットは大文字小文字を区別しない' do
    question = create(:question, user: user, tag_list: %w(Japan japan JAPAN))
    expect(question.tags.count).to eq 1
  end


  describe '並び替えがただしくできる' do
    before do

    end

    it '「人気」をクリックするとタグつけされた数がおおい順番になる' do
      create(:question, user: user, tag_list: ['りんご'])
      create(:question, user: user, tag_list: ['りんご, みかん'])
      create(:question, user: user, tag_list: ['りんご, みかん, ぶどう'])

      visit tags_path
      click_on '人気'
      within '.tags-list' do
        tag_names = all('.tag').map(&:text)
        expect(tag_names).to eq ['りんご × 3', 'みかん × 2', 'ぶどう × 1']
      end
    end

    it '「名前」をクリックするとアルファベット順（Aaあア亜）になる' do
      create(:question, user: user, tag_list: %w(日本 Japan ジャパン nippon にっぽん))

      visit tags_path
      click_on '名前'

      within '.tags-list' do
        tag_names = all('.tag').map(&:text)
        expect(tag_names).to eq ['Japan × 1', 'nippon × 1', 'にっぽん × 1', 'ジャパン × 1', '日本 × 1']
      end
    end

    it '新規：あたらしいタグ順になる' do
      create(:question, user: user, tag_list: %w(日本))
      create(:question, user: user, tag_list: %w(アジア))
      create(:question, user: user, tag_list: %w(世界))

      visit tags_path
      click_on '新規'

      within '.tags-list' do
        tag_names = all('.tag').map(&:text)
        expect(tag_names).to eq ['世界 × 1', 'アジア × 1', '日本 × 1']
      end
    end
  end
end
