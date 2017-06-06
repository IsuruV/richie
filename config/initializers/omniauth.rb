Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '228025157667481', '5ae25ba5ef16d8cb69112d051933cb90'
end