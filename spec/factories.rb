FactoryGirl.define do
  factory :knight do
    
  end
  factory :king do
    
  end
  factory :queen do
    
  end
  factory :bishop do
    
  end
  factory :rook do
    
  end
  factory :pawn do
    
  end
  factory :piece do
    
  end
  factory :game do
    
  end
  factory :enrollment do
    
  end
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password "secretPassword"
    password_confirmation "secretPassword"
    
  end
end