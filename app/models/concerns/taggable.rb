module Taggable
	extend ActiveSupport::Concern

  included do
    scope :any_tags, -> (tags){ where('tag_ids && ARRAY[?]', Array.wrap(tags).map(&:to_i)) }
    scope :all_tags, -> (tags){ where('tag_ids @> ARRAY[?]', Array.wrap(tags).map(&:to_i)) }
  end

  def tag_ids=(value)
    _ids = Array.wrap(value).select{ |v| !v.blank? }.map(&:to_i)
    write_attribute(:tag_ids, _ids)
  end

end
