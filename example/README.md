# OmniAuth MyUSA Example Application

To set up a client application that points to a dev/staging version of MyUSA:
1. Create a client application in MyUSA at `http://<myusa host:port>/oauth/applications`.

2. Copy the application id and secret and set them as environment variables:
  ```bash
  $ export APP_ID=...
  $ export APP_SECRET=...
  ```

2. Add the following to the `provider` call in `config.ru`:
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
  application will request. If it is left out (or is blank), the client
  application will not request any scopes and the authorization page will be
  skipped.

3. Uncomment the following line in `config.ru` and set the correct url for this
dummy app (it will default to `http://localhost:9292`):
  ```ruby
  OmniAuth.config.full_host = "http://<dummy host:port>"
  ```

4. Run the dummy app:
  ```bash
  $ rackup
  ```
  or to run it as a daemon (you may want to set up logging):
  ```bash
  $ rackup -D
  ```
