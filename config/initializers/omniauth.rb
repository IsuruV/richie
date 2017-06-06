Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1418855321467898', 'a97cc842ebfa77f495709bc01b004077'
end