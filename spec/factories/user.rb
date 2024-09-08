FactoryBot.define do
  factory :user do
    name { 'das' }
    email { 'asd@asd' }
    password { '123456' }
    age { 23 }
    role { 'user' }
    date_of_birth { '21/10/2002' }
  end
end
