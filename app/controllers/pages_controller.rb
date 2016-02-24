class PagesController < ApplicationController
  def contact

    @announces = Announce.all[0...3]
  end
end
