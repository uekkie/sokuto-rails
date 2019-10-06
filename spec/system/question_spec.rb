require 'rails_helper'

describe "Questions", type: :system do

  before do
    driven_by :selenium_chrome_headless
    visit questions_path
  end

  let!(:user) { create(:user) }

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
end
