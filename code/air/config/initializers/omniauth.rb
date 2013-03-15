Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, 'DgTieTPELodL7UIAwoBfug', '83t2pMlIvrlw8zPxqFv169ghDgY9kGXWAa4f3USw'
end
