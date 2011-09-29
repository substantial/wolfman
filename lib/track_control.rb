
class Robut::Plugin::TrackControl
  include Robut::Plugin
  include Wolfman::Jukebox
  
  def handle(time, sender_nick, message)
    
    request = words(message).join(" ")
    
    if sent_to_me?(message) and valid_request?(request)
    
      if currently_playing?
        
        if skip_request? request
          skip_track
          reply "(troll): #{current_track}"
        end
        
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
  #     skip this track
  #     skip track
  #     skip
  # 
  def valid_request?(message)
    message =~ /^skip/i
  end
  
  def skip_request?(message)
    message =~ /^skip/i
  end
  
end