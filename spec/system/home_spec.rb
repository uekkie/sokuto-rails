require 'rails_helper'

describe 'ホームページ' do
  before do
    driven_by :selenium_chrome_headless
  end

  it 'タイトルがあること' do
    visit root_url
    expect(page).to have_content 'Spark Hackers'
  end
end