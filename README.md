# OmniAuth CMP.LY

This gem contains the CMP.LY strategy for OmniAuth. CMP.LY uses the OAuth 2.0 flow.

## Installation

Add this line to your application's Gemfile:

```ruby
    gem 'omniauth-cmply'
```

And then execute:

```sh
    $ bundle
```
Or install it yourself as:

```sh
    $ gem install omniauth-cmply
```




## Usage

### Rails

If you're using Rails, you need to add the strategy to your `Gemfile`:

```ruby
    gem 'omniauth-cmply'
```

or you can pull them in directly from Github e.g.:

```ruby
    gem 'omniauth-twitter', :git => 'https://github.com/cmply/omniauth-cmply.git'
```

Once you've added the gem to your project, you need to add the following to your `config/initializers/omniauth.rb`:

```ruby
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :cmply, "consumer_key", "consumer_secret"
    end
```

Enter your `consumer_key` and `consumer_secret`, which you receive when you register your application with CMP.LY (they
call them API Key and Secret Key).

Now just follow the README at: https://github.com/intridea/omniauth

### Sinatra

```ruby
require 'omniauth'
require 'omniauth-cmply'

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :cmply, "consumer_key", "consumer_secret"
end

get '/auth/:provider/callback' do
  # Do something with auth_hash
  redirect to('/')
end

def auth_hash
  request.env['omniauth.auth']
end
```

## Supported Rubies

OmniAuth CMP.LY is tested under 1.8.7, 1.9.2, 1.9.3 and Ruby Enterprise Edition.

## Note on Patches/Pull Requests

- Fork the project.
- Make your feature addition or bug fix.
- Add tests for it. This is important so I don’t break it in a future version unintentionally.
- Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump
  version in a commit by itself I can ignore when I pull)
- Send me a pull request. Bonus points for topic branches.

## License

Copyright (c) 2012 by CMP.LY

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of
the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
