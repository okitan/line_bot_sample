class CallbackController < ApplicationController
  protect_from_forgery except: :create

  OP_ADDED_TO_FRIEND = 4
  OP_BLOCKED         = 8

  def create
    contents.each do |msg|
      p msg
      if msg.has_key?("opType")
        respond_to_friend_request(msg)
      else
        respond_to_talk(msg)
      end
    end

    respond_to do |format|
      format.json { render json: callbacks }
    end
  end

  protected
  def respond_to_friend_request(msg)
    case msg["opType"]
    when OP_ADDED_TO_FRIEND
      # TODO: enabled
      puts "TODO: started taking with channel #{msg["params"]}"
    when OP_BLOCKED
      # TODO: disabled
      puts "TODO: stop taking to channel #{msg["params"]}"
    else
      puts "unknown opType #{msg["opType"]}"
    end
  end

  def respond_to_talk(msg)
    puts "TODO: responding to talk"
  end

  private
  def callbacks
    params.require(:callback).require(:result)
  end

  def contents
    callbacks.map {|e| e["content"] }
  end
end
