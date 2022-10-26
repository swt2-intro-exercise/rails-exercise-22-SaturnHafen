FactoryBot.define do
  factory :author do
    first_name { "Alan" }
    last_name { "Turing" }
    homepage { "http://wikipedia.de/Alan_Turing" }
  end

  factory :empty_lastname do
    first_name { "Alan" }
    last_name {}
    homepage { "http://wikipedia.de/Alan_Turing" }
  end
end
