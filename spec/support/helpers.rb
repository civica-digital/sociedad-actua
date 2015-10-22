require_relative 'helpers/omniauth'
require_relative 'helpers/account'

RSpec.configure do |config|
  config.include Omniauth::Mock
  config.include Omniauth::SessionHelpers, type: :feature
  config.include Account::AccountHelper, type: :feature
end
OmniAuth.config.test_mode = true
