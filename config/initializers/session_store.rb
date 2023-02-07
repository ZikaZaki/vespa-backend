if Rails.env == "production"
  # Make sure to change the domain to match your production domain name before deploying. 
  Rails.application.config.session_store :cookie_store, key: "_vespa_backend_session", domain: "vespa-backend-heroku.herokuapp.com"
else
  # This is the default domain for development and test environments. 
  Rails.application.config.session_store :cookie_store, key: "_vespa_backend_session"
end
