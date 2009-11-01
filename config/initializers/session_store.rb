# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_scalerblog_session',
  :secret      => 'a1309ea43bbeda1304b3cd7c69dc5ff076a20bcac83d31b2c405a30f7733213af250abd884f82e49228903c9b2381792f2ff51286725a45464ffca3c0e4d61a4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
