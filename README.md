# OmniAuth::Strategies::Myusa

This gem contains the MyUSA strategy for OmniAuth.

MyUSA uses OAuth 2.0. To find out more information about MyUSA and how to create your own application visit the [developers](https://my.usa.gov/developer) section of MyUSA.

View the OmniAuth 1.0 docs for more information about strategy implementation: https://github.com/intridea/omniauth.

## Before You Begin

Sign in to [MyUSA](https://my.usa.gov/developer) and register an application. You will need to provide a redirect URI which is "YOUR_SITE/auth/myusa/callback" by default. Take note of your Consumer Key and Consumer Secret.

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-myusa', :git => 'https://github.com/GSA-OCSIT/omniauth-myusa.git'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
provider :myusa, "CONSUMER_KEY", "CONSUMER_SECRET", :scope => "profile tasks submit_forms notifications"
```

Replace CONSUMER_KEY and CONSUMER_SECRET with the appropriate values you obtained from [MyUSA](https://my.usa.gov/apps) earlier.

## Authentication Hash
An example auth hash available in `request.env['omniauth.auth']`:

```ruby
{"provider"=>"myusa",
 "uid"=>"r03Ke0000000000FrqOOFlq0DeNc9q1QQQQQQQQC",
 "info"=>{"email"=>"johnq@bloggs.com"},
 "credentials"=>{"token"=>"3gnsgg14ymf54mquevfry38ao", "expires"=>false},
 "extra"=>
  {"raw_info"=>
    {"title"=>nil,
     "first_name"=>nil,
     "middle_name"=>nil,
     "last_name"=>nil,
     "suffix"=>nil,
     "address"=>nil,
     "address2"=>nil,
     "city"=>nil,
     "state"=>nil,
     "zip"=>nil,
     "phone_number"=>nil,
     "mobile_number"=>nil,
     "gender"=>nil,
     "marital_status"=>nil,
     "is_parent"=>nil,
     "is_retired"=>nil,
     "is_veteran"=>nil,
     "is_student"=>nil,
     "email"=>"johnq@bloggs.com
     "uid"=>"r03Ke0000000000FrqOOFlq0DeNc9q1QQQk390QC"}}}
```

## Watch the RailsCast

Ryan Bates has put together an excellent RailsCast on OmniAuth:

[![RailsCast #241](http://railscasts.com/static/episodes/stills/241-simple-omniauth-revised.png "RailsCast #241 - Simple OmniAuth (revised)")](http://railscasts.com/episodes/241-simple-omniauth-revised)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
