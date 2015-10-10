require 'faker'
require 'fileutils'

namespace :populate do
  desc "Create random posts"
  task posts: :environment do
    tag_count = Tag.all.count
    random_number = Random.new.rand(20..30)
    random_number.times do |n|
      prng = Random.new
      title = Faker::Company.catch_phrase
      slug = Faker::Internet.slug
      content = Faker::Lorem.paragraph
      tag_ids = [prng.rand(tag_count),prng.rand(tag_count),prng.rand(tag_count)]
      Post.create!(title: title,
                   slug: slug,
                   content: content,
                   tag_ids: tag_ids)
      Asset.create!(filename: "test.png",
                    type: "Picture",
                    assetable_id: Post.last.id,
                    assetable_type: "Post")
      #create directory for files and then copy pictures to this directory
      #this allow to view image in application
      #
      directory_name = File.expand_path("public/uploads/picture/data/#{Picture.last.id}")
      FileUtils.mkdir_p directory_name unless File.directory?(directory_name)
      FileUtils.cp_r(File.expand_path("public/populate/test.png"),File.expand_path(directory_name))
      FileUtils.cp_r(File.expand_path("public/populate/thumb_test.png"),File.expand_path(directory_name))
    end
  end

  desc "Create random event"
  task events: :environment do
    tag_count = Tag.all.count
    random_number = Random.new.rand(20..30)
    random_number.times do |n|
      prng = Random.new
      title = Faker::Company.catch_phrase
      address = Faker::Address.street_address
      started_at = Faker::Date.forward(10)
      tag_ids = [prng.rand(tag_count),prng.rand(tag_count),prng.rand(tag_count)]
      Event.create!(title: title,
                    address: address,
                    started_at: started_at,
                    tag_ids: tag_ids)
      Asset.create!(filename: "file.txt",
                    type: "Attachment",
                    assetable_id: Event.last.id,
                    assetable_type: "Event")
      #create directory for file and then copy attachtment to this directory
      #this allow to view file in application
      #
      directory_name = File.expand_path("public/uploads/attachment/data/#{Attachment.last.id}")
      FileUtils.mkdir_p directory_name unless File.directory?(directory_name)
      FileUtils.cp_r(File.expand_path("public/populate/file.txt"),File.expand_path(directory_name))

    end
  end

  desc "Create random video"
  task videos: :environment do
    tag_count = Tag.all.count
    random_number = Random.new.rand(20..30)
    random_number.times do |n|
      prng = Random.new
      title = Faker::Company.catch_phrase
      slug = Faker::Internet.slug
      description = Faker::Lorem.paragraph
      tag_ids = [prng.rand(tag_count),prng.rand(tag_count),prng.rand(tag_count)]
      Video.create!(title: title,
                    slug: slug,
                    description: description,
                    tag_ids: tag_ids)

    end
  end

  desc "Create random tags"
  task tags: :environment do
    Tag.populate(10) do |tag|
      tag.name = Faker::Internet.user_name
      tag.slug = Faker::Internet.slug
    end
  end
end
