require "administrate/base_dashboard"

class ArticleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    comments: Field::HasMany,
    taggings: Field::HasMany,
    tags: Field::HasMany,
    author: Field::BelongsTo,
    id: Field::Number,
    title: Field::Text,
    body: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    image_file_name: Field::Text,
    image_content_type: Field::Text,
    image_file_size: Field::Number,
    image_updated_at: Field::DateTime,
    view_count: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :title,
    :author,
    :comments,
    :taggings,
    :tags,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :comments,
    :taggings,
    :tags,
    :author,
    :id,
    :title,
    :body,
    :created_at,
    :updated_at,
    :image_file_name,
    :image_content_type,
    :image_file_size,
    :image_updated_at,
    :view_count,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :author,
    :title,
    :body,
    :tags,
    :view_count,
  ].freeze

  # Overwrite this method to customize how articles are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(article)
    "##{article.id} #{article.title}"
  end
end
