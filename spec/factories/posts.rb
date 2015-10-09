FactoryGirl.define do
  factory :post do
  	title "Title"
  	slug "I'm slug!"
  	content "Content"

    factory :invalid_post do
      title nil
      slug nil
      content nil
    end
    
  end


end
