FactoryBot.define do
  factory :post do
    title { 'タイトル1' }
    content { '本文1' }
    
    association :user, factory: :user # Post に紐づく User も作成できるように設定
  end
end
