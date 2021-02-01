# setting cookies env

if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_house_of_events_app", domain: "eventshouse-api.herokuapp.com"
else
    Rails.application.config.session_store :cookie_store, key: "_house_of_events_app"
end

