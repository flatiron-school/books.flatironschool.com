# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_book do
    user_id 1
    book_id 1
    format "MyString"
  end
end
