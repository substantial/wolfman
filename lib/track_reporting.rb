
class Robut::Plugin::TrackReporting
  include Robut::Plugin
  include Wolfman::Jukebox
  
  def handle(time, sender_nick, message)
    
    if sent_to_me?(message) and valid_request?(words(message).join(" "))
      
      if currently_playing?
        reply "(chewie): #{current_track}"
      else
        reply "No Music Is Playing"
      end
      
    else
      
      # Message is not sent it it or the message contains a request not for reporting tracks
      
    end
    
    
  end
  
  #
  # Valid request messages:
  # 
  #     what is playing
  #     what's playing
  #     playing
  # 
  def valid_request?(message)
    message =~ /^(?:what is|what's)? ?playing\??$/i
  end
  
end