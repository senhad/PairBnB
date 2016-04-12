Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, ENV["Facebook_app_id"], ENV["Facebook_secret_key"]
    end

  