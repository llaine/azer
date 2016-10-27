Clearance.configure do |config|
  config.mailer_sender = "reply@example.com"
  config.allow_sign_up = true
  config.password_strategy = Clearance::PasswordStrategies::BCrypt
  config.redirect_url = "/"
end
