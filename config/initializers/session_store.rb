# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_oozakazoo_session',
  :secret      => 'a2040f6d1442095805a2495410038ef322dd137a4f10c93b2773937f3e6f68c78f117fd395072ad758cdb460f8fc27bdea61ba38dda79d0df1e8cc8417acd1aa'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
