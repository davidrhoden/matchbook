Factory.define :user do |user|
  user.username                  "MichaelHartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :username do |n|
  "Person #{n}"
end