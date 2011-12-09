Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "i0UGAiRLL4czlfjESOKoPA", "uR8rXUZB8HTBYEN0f4nZEMmbFjN9qotCNPAAqoc"
  provider :facebook, "170602046356588", "61a56e73c47a90e9f3cb41bccca94f94"
end
