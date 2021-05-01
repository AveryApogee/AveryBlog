FactoryBot.define do
  factory :user do
    id {1}
    email {"test@user.com"}
    password {"qwerty"}
    # Add additional fields as required via User model
  end
end
