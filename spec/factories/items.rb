FactoryBot.define do
  
  factory :item do
    title                        {'カメラ'}
    text                         {'カメラです'}
    category_id                  {'2'}
    product_condition_id         {'2'}
    prefecture_id                {'2'}
    estimated_shipping_date_id   {'2'}
    delivery_charged_id          {'2'}
    price                        {10000}
    
    association :user




    # 1枚の画像をアップロードする
      after(:build) do |item|
        item.image.attach(io: File.open('spec/images/113299.jpg'), filename: '113299.jpg')
      end
  end
end
