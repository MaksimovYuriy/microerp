FactoryBot.define do
  factory :worker do
    username { "MyString" }
    encrypted_password { "MyString" }
    password_salt { "MyString" }
    role { 1 }
    status { 1 }
  end
end
