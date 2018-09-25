# WebFetcher API

A simple, yet powerful API to get the contents of a webpage (links, h1, h2, h3)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes

### Prerequisites

What things you need to install the software and how to install them

Ruby 2.4.1 installed locally, or change the ruby line in Gemfile to your local version

In Gemfile
```
ruby '2.4.1'
```

Change it to:

```
ruby 'your_local_version'
```

### Installing


Clone this repository


### Setup the database

navigate to the cloned repo in your terminal

```
rake db:create
```

```
rake db:migrate
```

### Run the server

```
rails s
```

Now, if everything went perfectly you should be able to communicate with the server on port 3000


## Using the API

There are two functions for this API

### Parse and save the contents of a specific url, eg. 'https://www.telemonetize.com'

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

### Get all saved urls and their contents

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

## Parsing the response

Parse the urls and get the ids of it's contents

The JSON response will look something like this

Get the urls

### URL: ['data'][0] --> ['attributes'] --> ['url']
('https://www.telemonetize.com')

![alt text](https://i.imgur.com/oceizHr.jpg)

###Content ID: ['data'][0] --> ['relationships'] --> ['contents'] --> ['data'][0] --> ['id']
('58')


Get the contents

![alt text](https://i.imgur.com/V70ZBhg.jpg)

###Content type: ['included'][0] --> ['attributes'] --> ['wp-content-type']
(eg. 'a')

###Content data: ['included'][0] --> ['attributes'] --> ['data']
(eg. '/')

## Built With

* [Ruby On Rails](https://github.com/rails/rails) - The web framework used
* [jsonapi-resources](https://github.com/cerebris/jsonapi-resources) - JSON API library
* [Nokogiri](https://github.com/sparklemotion/nokogiri) - Used for web scraping

## Authors

* **Alexander Sideris** - *Initial work* - (https://github.com/alexandersideris)

See also the list of [contributors](https://github.com/alexsideris/railsapi/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
