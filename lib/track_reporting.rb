class Robut::Plugin::TrackReporting
  include Robut::Plugin
  
  def handle(time, sender_nick, message)
    
    if valid_request(message)
      
      if currently_playing?
        reply "#{current_track[:artist]} ~ #{current_track[:track]}"
      else
        reply "No Music Is Playing"
      end
      
    else
      
    end
    
    
  end
  
  #
  # Valid request messages:
  # 
  #     what is playing
  #     what's playing
  #     playing
  # 
  def valid_request(message)
    message =~ /^(?:what is|what's)? ?playing$/i
  end
  
  #
  # @todo this is a STUB method that will be replaced with the method to ask
  #   if the music service is currently playing music
  # 
  def currently_playing?
    true
  end
  
  #
  # @todo this is a STUB response that will be replaced with the data form the
  #   the music service for the current playing track
  # 
  def current_track
    { 
      :artist => 'Prince', 
      :album => 'Diamonds and Pearls', 
      :track => 'Something Funky This House Comes' 
    }
  end
  
  
  
end