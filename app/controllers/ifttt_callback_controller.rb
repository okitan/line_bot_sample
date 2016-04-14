# coding: utf-8
# Usage of IFTTT
# 1. Select Maker for Action
# 2. Set URL https://{YOUR_APP}/ifttt/callbacks
#    Set Method POST
#    Set Content-Type application/json
#    Set Body `{"mid": "{YOUR_MID}"}`
# YOUR_MID can be obtained when you add this to the friends

class IftttCallbackController < ApplicationController
  protect_from_forgery except: :create

  def create
    Message.create([*callback[:mid]], callback[:message])
  end

  private
  def callback
    params.require(:ifttt_callback).permit(:mid, :message, mid: [])
  end
end
