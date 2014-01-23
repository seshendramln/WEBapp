# Be sure to restart your server when you modify this file.

#Webapp::Application.config.session_store :cookie_store, key: '_webapp_session'
Webapp::Application.config.session_store :active_record_store
ActionDispatch::Session::ActiveRecordStore.session_class