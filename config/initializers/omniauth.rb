#comment out Google sign-in code for now

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, "864103830426-htet87udae9elnpgk9et0hp8jp930isj.apps.googleusercontent.com", "TWytlYCQnEcq7OJ3TR0-mZVY"
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user:email,user:follow"
end