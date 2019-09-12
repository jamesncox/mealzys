Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "864103830426-htet87udae9elnpgk9et0hp8jp930isj.apps.googleusercontent.com", "TWytlYCQnEcq7OJ3TR0-mZVY"
end