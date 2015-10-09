FactoryGirl.define do
  factory :tag do
  	name "name"
  	slug "slug"

  	factory :invalid_tag do
  		name nil
  		slug nil
  	end    
  end

end
