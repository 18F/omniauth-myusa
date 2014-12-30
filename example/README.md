# OmniAuth MyUSA Example Application

To set up a client application that points to a dev/staging version of MyUSA:

1. Ensure you have Ruby installed - version 2.0 or greater.

1. Install the Bundler gem:
  ```bash
  $ gem install bundler
  ```
  
1. Clone this repository locally and change to the `example` folder:
   ```bash
   $ git clone https://github.com/18F/omniauth-myusa/
   $ cd omniauth-myusa/example
   ```

1. Use `bundle` to install the necessary dependencies:
   ```bash
   $ bundle install
   ```

1. Register a new client application with MyUSA at `https://my.usa.gov/oauth/applications`

1. Copy the application id and secret and set them as environment variables:
  ```bash
  $ export APP_ID=...
  $ export APP_SECRET=...
  ```

1. Add the following to the `provider` call in `config.ru`:
  ```ruby
  provider :myusa, ENV['APP_ID'], ENV['APP_SECRET'], {
    scope: %q(...),
    client_options: {
      site: 'http://<myusa host:port>',
      token_url: '/oauth/token'
    }
  }
  ```
  where `:scope => %q(...)` is a space separated list of scopes that the client
  application will request. 

1. Uncomment the following line in `config.ru` and set the correct url for this
dummy app (it will default to `http://localhost:9292`):
  ```ruby
  OmniAuth.config.full_host = "http://<dummy host:port>"
  ```

1. Run the dummy app:
  ```bash
  $ rackup
  ```
  or to run it as a daemon (you may want to set up logging):
  ```bash
  $ rackup -D
  ```
