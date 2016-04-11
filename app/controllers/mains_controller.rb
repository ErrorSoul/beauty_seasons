class MainsController < ApplicationController
  layout 'session'

  def index
    @tigings = Tiging.all
    @blocks = Block.includes(:parts).all
  end
end
