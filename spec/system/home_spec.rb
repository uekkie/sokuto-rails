require 'rails_helper'


describe 'ホームページ' do
  before do
    driven_by :selenium_chrome_headless
  end

  it 'タイトルがあること' do
    visit root_url
    expect(page).to have_content 'Spark Hackers'
  end

  it '人気、今週、今月のタブが存在すること' do
    visit root_url
    %w(人気 今週 今月).each { |content|
      expect(page).to have_content content
    }
  end
end