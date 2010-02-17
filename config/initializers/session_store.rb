# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pasteme_session',
  :secret      => '1e3f9836c4b25e6bfd727f80f379c6dd5a7f877b2a44867ece246b0bec4c80385539764883cde311ddca89dd3f55b9ac3f58a552761cb8145acab1fe49d17bc1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
