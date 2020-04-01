# frozen_string_literal: true
# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'nguyenbaokhatu',
  :password => 'Khatu2013',
  :domain => 'infinite-brushlands-18662.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 465,
  :authentication => :plain,
  :enable_starttls_auto => true
}
