class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  belongs_to :author

  has_attached_file :image,
                    :styles => { :large => "1920x1920", :medium => "1024x1024",
                    :small => "800x800", :extra_small => "300x300", :thumb => "200x200" }

  validates_attachment_content_type :image,
                                    :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    tag_names         = tags_string.split(",").collect { |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags         = new_or_found_tags
  end

  # Delete tags that have no articles associated.
  def delete_empty_tags
    tags = Tag.all
    tags.each { |tag| tag.delete if tag.articles.count == 0 }
  end

  def increase_view_count
    self.view_count += 1
    self.save
  end
end
