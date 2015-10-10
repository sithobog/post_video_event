class ContentView < ActiveRecord::Base

	paginates_per 10

	self.table_name = "content_views"
	self.primary_key = "id"

	scope :any_tags, -> (tags){ where('tag_ids && ARRAY[?]', Array.wrap(tags).map(&:to_i)) }
	scope :recently, -> {order(created_at: :desc) }

	# Prevent creation of new records and modification to existing records
	#
	def readonly?
		return true
	end

	# Prevent objects from being destroyed
	#
	def before_destroy
		raise ActiveRecord::ReadOnlyRecord
	end


end
