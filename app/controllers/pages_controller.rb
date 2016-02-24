class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def contact

    @announces = Announce.all[0...3]
  end
end
