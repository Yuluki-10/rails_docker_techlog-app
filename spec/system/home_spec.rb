require 'rails_helper'

RSpec.describe 'Homes', type: :system do
  before do
    driven_by(:rack_test)
    # driven_by :selenium_chrome_headless # ヘッドレスモードで実行に変更（Docker環境なので設定不必要）
  end

  # pending "add some scenarios (or delete) #{__FILE__}"
  describe 'トップページの検証' do
    it 'Home#top という文字列が表示される' do
      visit '/'

      expect(page).to have_content('Home#top')
    end
  end
end
