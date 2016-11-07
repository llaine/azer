class HomeController < ApplicationController
  def index
    render component: 'SmallLoaderComponent'
  end
end
