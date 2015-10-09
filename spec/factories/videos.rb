FactoryGirl.define do
  factory :video do
    title "title"
    slug "slug"
    description "bla bla bla"

    factory :invalid_video do
    	title nil
    	slug nil
    	description nil
    end

  end

end
