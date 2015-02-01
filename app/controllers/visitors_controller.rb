class VisitorsController < ApplicationController
  def index
    if is_mobile?
      redirect_to home_index_path
    else
      render layout: false
    end
  end
end
