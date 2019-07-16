require 'rails_helper'

RSpec.feature "Questions", type: :system do

  let!(:user) { create(:user) }

  feature 'ログインユーザーは質問を作れる' do
    before { sign_in user }

    scenario '質問の作成' do
      visit root_path
      click_on '質問する'

      fill_in 'タイトル', with: 'プログラマーにとって大切なことはなんですか'
      fill_in 'タグ（カンマで区切ります）', with: '職業, プログラマー, 考え方'
      fill_in '質問の内容', with: 'プロのプログラマーを続けていく上で、あなたが大切にしている考えや、心がけていることなどあれば教えてください。'

      click_on '投稿する'

      expect(page).to have_content '質問「プログラマーにとって大切なことはなんですか」を作成しました'
      expect(page).to have_selector "[data-test='question_title']", text: 'プログラマーにとって大切なことはなんですか'
      expect(page).to have_selector '.tags', text: '職業 プログラマー 考え方'
      expect(page).to have_selector '.content', text: 'プロのプログラマーを続けていく上で、あなたが大切にしている考えや、心がけていることなどあれば教えてください。'
    end
  end
end
