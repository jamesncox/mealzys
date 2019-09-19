#comment out Google sign-in code for now

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "864103830426-htet87udae9elnpgk9et0hp8jp930isj.apps.googleusercontent.com", "TWytlYCQnEcq7OJ3TR0-mZVY"
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :github, ENV['d0eb9a389750bddd7b7a'], ENV['d5804f1742c40b9168207d2e676c4d3365510183'], scope: "user:email,user:follow"
# end