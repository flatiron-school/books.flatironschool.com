if Rails.env.production?
  github_key = ENV['GITHUB_KEY_PRODUCTION']
  github_secret = ENV['GITHUB_SECRET_PRODUCTION']
elsif Rails.env.development?
  github_key = ENV['GITHUB_KEY']
  github_secret = ENV['GITHUB_SECRET']
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, github_key, github_secret, scope: "orgs, user"
end


