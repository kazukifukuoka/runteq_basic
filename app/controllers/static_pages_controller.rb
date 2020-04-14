class StaticPagesController < ApplicationController
  def top
    render template: 'static_pages/top'
  end
end
