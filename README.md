[ ![Codeship Status for ronaldsalas/omniauth-kona](https://codeship.com/projects/4bb85690-450f-0133-7583-6641cf1712e7/status?branch=master)](https://codeship.com/projects/104599)

# OmniAuth Kona

OmniAuth strategy for authenticating your users using Kona.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-kona'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-kona

## Usage

In your Kona Business account administration, register your application to get the Client ID and Client secret. Make sure that you put `http://YOURSERVER/auth/kona/callback` in the redirect URI field, with `YOURSERVER` is your application's server name (and port number if any). Kona matches exactly the redirect URI passed by the gem to the URI it has on record to authenticate the user, so make sure that you put in the correct URI.

Afterwards you can add the middleware in your Rails app in `config/initializers/omniauth.rb`

```ruby
    Rails.application.config.middleware.use OmniAuth::Builder do
        provider :kona, "ClientID", "ClientSecret"
    end
```

You can check out the Sinatra example included.

### Connecting to the sandbox environment

You can connect your app to Kona's sandbox environment for testing purposes. First, get a KB account in their sandbox environment so that you can register your app. Then add the following hash to the middleware configuration:

```ruby
    Rails.application.config.middleware.use OmniAuth::Builder do
        provider :kona, "ClientID", "ClientSecret",
            {
               :client_options => {
                    :site => 'https://sandbox.kona.com',
                    :authorize_url => 'https://sandbox.kona.com/oauth/authorize',
                    :token_url => 'https://sandbox.kona.com/oauth/token'
               }
           }
    end
```

## Auto Hash schema

The Kona OmniAuth strategy returns the following information

```
    {
      "provider":"kona",
      "uid":integer,
      "info":{
        "email":string,
        "name":string,
        "image":string, url
        },
      "credentials":{
        "token":string,
        "refresh_token":string,
        "expires_at":datetime,
        "expires":true},
      "extra":{
        "raw_info":{
          "id":integer,
          "email":string,
          "name":string,
          "picture_thumb":string, url,
          "updated_at":datetime, ,
          "href":string, url,
          "current_account":{
            "id":integer,
            "member":boolean}
        }
      }
    }
```

### Guest Members

We have provided the key `member` under the `extra` hash to identify if user is a member of the Kona Business account or not

## Contributing

1. Fork it ( https://github.com/ronaldsalas/omniauth-kona/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
