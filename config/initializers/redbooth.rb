Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :redbooth, ENV['REDBOOTH_CLIENT_ID'], ENV['REDBOOTH_CLIENT_SECRET'],
    client_options: {
      site: 'https://redbooth.com/api/3',
      token_url: 'https://redbooth.com/oauth2/token',
      authorize_url: 'https://redbooth.com/oauth2/authorize'
  }, 
  scope: 'all'
end
