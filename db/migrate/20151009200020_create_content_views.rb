class CreateContentViews < ActiveRecord::Migration
	def up
		execute("
			CREATE OR REPLACE VIEW content_views AS
			SELECT id, title, 'Post' AS type, slug,content, NULL AS description, NULL AS started_at, NULL AS address, tag_ids, created_at, updated_at FROM posts
			UNION
			SELECT id, title, 'Event' AS type, null, null, null, started_at, address, tag_ids, created_at, updated_at FROM events
			UNION
			SELECT id, title, 'Video' AS type, slug, null, description, null, null, tag_ids, created_at, updated_at FROM videos
			")
	end

	def down
		execute("DROP VIEW content_views;")
	end
end
