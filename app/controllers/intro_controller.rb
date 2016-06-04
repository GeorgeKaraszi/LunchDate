class IntroController < ApplicationController
  def index
    @users = User.all_profiles
  end

  def schedule
  end
end
