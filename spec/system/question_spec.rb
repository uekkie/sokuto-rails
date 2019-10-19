require 'rails_helper'

describe "Questions", type: :system do

  before do
    driven_by :selenium_chrome_headless
    visit questions_path
  end

  let!(:user) { create(:user) }
  let!(:question) { create(:question, user: user) }

  it '新着、得票数、未回答のタブが存在すること' do
    expect(page).to have_content '新着'
    expect(page).to have_content '得票数'
    expect(page).to have_content '未回答'
  end

  context 'ログインしているとき' do
    before do
      sign_in user
      visit questions_path
    end

    scenario '質問がつくれる' do
      click_on '質問する'

      fill_in 'タイトル', with: 'プログラマーにとって大切なことはなんですか'
      fill_in 'タグ（カンマで区切ります）', with: '職業, プログラマー, 考え方'
      fill_in '質問の内容', with: 'プロのプログラマーを続けていく上で、あなたが大切にしている考えや、心がけていることなどあれば教えてください。'

      click_on '投稿する'

      expect(page).to have_content '質問「プログラマーにとって大切なことはなんですか」を作成しました'
      expect(page).to have_content 'プログラマーにとって大切なことはなんですか'
      expect(page).to have_content '職業 プログラマー 考え方'
      expect(page).to have_content 'プロのプログラマーを続けていく上で、あなたが大切にしている考えや、心がけていることなどあれば教えてください。'
    end

    scenario 'タイトルがないと作成に失敗する' do
      click_on '質問する'

      fill_in 'タイトル', with: ''
      fill_in 'タグ（カンマで区切ります）', with: '職業, プログラマー, 考え方'
      fill_in '質問の内容', with: 'プロのプログラマーを続けていく上で、あなたが大切にしている考えや、心がけていることなどあれば教えてください。'

      click_on '投稿する'

      expect(page).to have_content 'タイトルを入力してください'
    end

    scenario '本文がなくても作成できる' do
      click_on '質問する'

      fill_in 'タイトル', with: 'プログラマーにとって大切なことはなんですか'
      fill_in 'タグ（カンマで区切ります）', with: '職業, プログラマー, 考え方'
      fill_in '質問の内容', with: ''

      click_on '投稿する'

      expect(page).to have_content '質問「プログラマーにとって大切なことはなんですか」を作成しました'
      expect(page).to have_content 'プログラマーにとって大切なことはなんですか'
      expect(page).to have_content '職業 プログラマー 考え方'
    end
  end

  describe '自分の質問に対して' do
    it '更新できる' do
      sign_in user

      visit question_path(question)
      within(:css, ".question > .actions") do
        click_on '編集'
      end

      fill_in '質問の内容', with: '記事を更新しました'
      click_on '更新する'

      expect(question.reload.content).to eq '記事を更新しました'
    end
  end


  describe '質問一覧の表示件数' do
    before do
      50.times { |i| create(:question, user: user, title: "質問その#{i}", content: "質問#{i}の本文です。") }
    end

    it '10件、30件、50件の表示ができる' do
      expect(Question.count).to be >= 50

      visit questions_path
      expect(all('.question').size).to eq 10
      # '30件をクリックすると、30件まで表示される' do
      click_on '30件'
      expect(page).to have_content 'すべての質問'
      expect(all('.question').size).to eq 30
      # '50件をクリックすると、50件まで表示される' do
      click_on '50件'
      expect(page).to have_content 'すべての質問'
      expect(all('.question').size).to eq 50

      click_on '10件'
      expect(page).to have_content 'すべての質問'
      expect(all('.question').size).to eq 10
    end
  end
end
