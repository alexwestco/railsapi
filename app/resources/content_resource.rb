class ContentResource < JSONAPI::Resource
  attributes :content_type, :data
  has_one :webpage

  filter :webpage
end