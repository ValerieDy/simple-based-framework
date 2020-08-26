require 'require_all'
require 'capybara'
require 'capybara/dsl'
require 'webdrivers/chromedriver'
require 'ffaker'
require 'pry'
require 'site_prism'
require 'site_prism/all_there'

# Load site prism page objects
require('pages/general_page')
Dir.glob(File.join(File.dirname(__FILE__), 'pages', '**', '*.rb')).each{|file| require file}


logging_preferences = { browser: 'ALL' }
Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(loggingPrefs: logging_preferences)
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('window-size=1920,1080')

  # Run headless by default unless CHROME_HEADLESS specified
  options.add_argument('headless') if ENV['CI']

  options.add_argument('disable-gpu')

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities,
    options: options
  )
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :chrome
  config.app_host = 'http://automationpractice.com'
end

Capybara.default_max_wait_time = 10

RSpec.configure do |config|
  config.include Capybara::DSL
end




