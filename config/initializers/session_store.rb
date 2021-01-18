if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: 'backend_punchmachine', domain: 'name-of-you-app-json-api'
else
    Rails.application.config.session_store :cookie_store, key: 'backend_punchmachine'
end