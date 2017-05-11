Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1457056507684563', '5972b40015d40ee08847cb374ad0ec3c'
end