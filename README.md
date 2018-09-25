# Webpage Content API

A simple yet powerful API to get the contents of a webpage

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Ruby 2.4.1 installed locally, or change the ruby line in Gemfile to your local version
```

### Installing

Simple installation


```
Clone this repository
```

Setup the database

```
navigate to the cloned repo in your terminal and run 'rake db:create' and 'rake db:migrate'
```

Run the server

```
run 'rails s'
```

Now, if everything went perfectly you should be able to communicate with the server on port 3000


### Don't want to install it locally?

# Use it in production

Just follow the instruction below in the 'Using the API' section and substitute 'http://localhost:3000/...' with 'https://railsapi.herokuapp.com/...'

## Using the API

There are two functions for this API

# 1) Get the contents of a specific url and save it's contents, eg. 'https://www.telemonetize.com'

```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"webpages", "attributes":{"url":"https://www.telemonetize.com”}}}’ http://localhost:3000/webpages
```

Or in ruby

```
require 'net/http'
require 'uri'

uri = URI.parse("http://{type:webpages,")
request = Net::HTTP::Post.new(uri)
request.content_type = "application/vnd.api+json"
request["Accept"] = "application/vnd.api+json"
request.body = "{data:"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

# response.code
# response.body
```

# 2) Get all saved urls and their contents

```
curl -i -H "Accept: application/vnd.api+json" "http://localhost:3000/webpages?include=contents&fields%5Bcontents”
```

Or in ruby

```
require 'net/http'
require 'uri'

uri = URI.parse("http://localhost:3000/webpages?include=contents")
request = Net::HTTP::Get.new(uri)
request["Accept"] = "application/vnd.api+json"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

# response.code
# response.body
```

## Built With

* [Ruby On Rails](https://github.com/rails/rails) - The web framework used
* [jsonapi-resources](https://github.com/cerebris/jsonapi-resources) - JSON API library
* [Nokogiri](https://github.com/sparklemotion/nokogiri) - Used for web scraping

## Authors

* **Alexander Sideris** - *Initial work* - (https://github.com/alexsideris)

See also the list of [contributors](https://github.com/alexsideris/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
