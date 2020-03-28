# frozen_string_literal: true
# Description/Explanation of ApplicationController class

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
end
