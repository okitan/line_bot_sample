class CallbackController < ApplicationController
  protect_from_forgery except: :create

  def create
    callbacks.each do |msg|
      p msg
    end

    respond_to do |format|
      format.json { render json: callbacks }
    end
  end

  private
  def callbacks
    params.require(:callback).require(:result)
  end
end
