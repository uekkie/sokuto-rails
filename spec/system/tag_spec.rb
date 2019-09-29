require 'rails_helper'

RSpec.feature "Tags", type: :system do
  it '人気、名前、新規のタブが存在すること' do
    visit tags_url

    expect(page).to have_content '人気'
    expect(page).to have_content '名前'
    expect(page).to have_content '新規'
  end
end