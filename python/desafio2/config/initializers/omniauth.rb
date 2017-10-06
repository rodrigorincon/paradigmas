OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_API_ID'], ENV['GOOGLE_API_KEY'], {client_options: {ssl: {ca_file: Rails.root.join(ENV['CERT_FILE']).to_s}}}
end