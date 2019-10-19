require 'rails_helper'

RSpec.describe '信用度', type: :model do

  let!(:questioned_user) { FactoryBot.create(:user) }
  let!(:answered_user) { FactoryBot.create(:user) }
  let!(:voted_user) { FactoryBot.create(:user) }
  let!(:question) { FactoryBot.create(:question, user: questioned_user) }
  let!(:answer) { FactoryBot.create(:answer, user: answered_user, question: question) }

  describe '信用度は以下の条件で獲得可能' do
    it ' 質問への賛成票: +5' do
      expect(question.user.credit_score).to eq 0
      question.upvote_by voted_user
      expect(question.user.reload.credit_score).to eq 5
    end

    it ' 回答への賛成票: +10' do
      expect(answer.user.credit_score).to eq 0
      answer.upvote_by voted_user
      expect(answer.user.reload.credit_score).to eq 10
    end

    it ' 回答が「承認済み」とマークされた: +15 (承認者には +2)' do
      expect(answer.question.answers.where(accepted: true)).to be_empty
      answer.update!(accepted: true)
      expect(question.answers.where(accepted: true)).to_not be_empty
      expect(answer.user.credit_score).to eq 15
      expect(answer.question.user.credit_score).to eq 2
    end

    it ' 推奨した編集内容が承認された: +2 (ユーザーあたり合計 +1000 まで)'
    it ' 回答にお礼が授与された: +お礼の全額'
    it ' 回答に自動的にお礼が授与された: お礼の額の +1/2 (お礼の仕組みの詳細を読む) '
    it ' サイトの関連付けボーナス: +100 各サイトで (サイトごとに最高 1 度授与)'
  end

  describe '信用度は以下の条件で失効する' do
    it '質問への反対票: −2'
    it '回答への反対票: −2'
    it '回答に反対投票した: −1'
    it '質問にお礼を提示した: -お礼の全額'
    it '自分の投稿が、6 件のスパムまたは不快の通報を受けた:−100'
  end

end
