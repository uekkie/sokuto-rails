require 'rails_helper'

describe "Answers", type: :system do
  let!(:user) { create(:user) }
  let!(:user_ueki) { create(:user_ueki) }
  let!(:question_by_userA) { create(:question, user: user) }
  let!(:question_by_self) { create(:question, user: user_ueki) }
  let!(:answer) { create(:answer, user: user_ueki, question: question_by_userA) }

  before do
    driven_by :selenium_chrome_headless
    visit questions_path(question_by_userA)
  end


  context 'ログインしていないとき' do
    it '回答できない' do
      visit question_path(question_by_userA)
      expect(page).to have_no_selector '.answers-box'
    end
  end

  context 'ログインしているとき' do
    before do
      sign_in user_ueki
    end

    it '回答できるテキストボックスがある' do
      visit question_path(question_by_userA)
      within(:css, '.answers-box') do
        expect(page).to have_selector '#answer_body'
        expect(page).to have_button '投稿する'
      end
    end

    context '他のユーザーの質問のとき' do
      it '回答できる' do
        visit question_path(question_by_userA)
        expect {
          fill_in 'answer_body', with: 'わたしは〇〇だとおもいます。'
          click_on '投稿する'
        }.to change { Answer.count }.by(1)

        expect(current_path).to eq question_path(question_by_userA)
      end
    end

    context '自分の質問のとき' do
      it '回答できる' do
        visit question_path(question_by_self)
        expect {
          fill_in 'answer_body', with: '補足があればおねがいします'
          click_on '投稿する'
        }.to change { Answer.count }.by(1)

        expect(current_path).to eq question_path(question_by_self)
      end
    end

    describe '自分の回答に対して' do
      it '更新できる' do
        visit question_path(answer.question)
        within(:css, 'ul.answers > li') do
          expect(page).to have_content answer.user.name
          expect(page).to have_content answer.content

          click_on '編集'

          fill_in '回答', with: 'やっぱりこの回答にします'
          click_on '更新'
          expect(page).to have_content 'やっぱりこの回答にします'

        end
      end
      it '削除できる'
    end
  end
end
