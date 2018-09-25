class ContentResource < JSONAPI::Resource
  attributes :wp_content_type, :data
  has_one :webpage

  filter :webpage
end