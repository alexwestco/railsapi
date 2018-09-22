class WebpageResource < JSONAPI::Resource
  attributes :url
  has_many :contents
end