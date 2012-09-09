class WelcomeController < ApplicationController

  before_filter :authorize

  def home
  end
end
