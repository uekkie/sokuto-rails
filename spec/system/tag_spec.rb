require 'rails_helper'

RSpec.feature "Tags", type: :system do
  it '人気、名前、新規のタブが存在すること' do
    visit tags_url
    %w(人気 名前 新規).each { |content|
      expect(page).to have_content content
    }
  end
end