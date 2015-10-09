FactoryGirl.define do
  factory :event do
  	title "title"
  	address "address"
  	started_at "2015-10-15 00:00:00"

  	factory :invalid_event do
  		title nil
  		address nil
  		started_at nil
  	end
    
  end

end
