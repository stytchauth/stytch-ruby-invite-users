# stytch-ruby-magic-links

##### 1. Add Magic Link URL
Visit https://stytch.com/dashboard/magic-link-urls to add
`http://localhost:4567/authenticate` as a valid invite URL.

##### 2. Set ENV vars
Set your project ID and secret in the `.env` file.
These can be found in the Stytch developer dashboard under API keys. 

You can also set `STYTCH_ENV` to `live` to use your live project.

##### 3. Install dependencies

`gem install bundler` (Skip this if you've already installed bundle)

`bundle install`

##### 4. Run the Server

Run `ruby ./server.rb`

##### 5. Login

Visit `http://localhost:4567` and send your user an invite.

If your own email is already on the project, you can invite an alias such as me+1@mydomain.com so that the request comes to your own email, me@mydomain.com.

Then check for the Stytch email and click the Log in button.
You should be signed in!
