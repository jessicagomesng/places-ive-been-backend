if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_places-ive-been', domain: 'places-ive-been-json-api'
  else
    Rails.application.config.session_store :cookie_store, key: '_places-ive-been'
end 