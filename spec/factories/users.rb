FactoryBot.define do
  factory :user do
    email  { 'tester@yopmail.com' }
    password { 123456 }
    password_confirmation { 123456 }
  end
end