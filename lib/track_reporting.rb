class Robut::Plugin::TrackReporting
  include Robut::Plugin
  
  def handle(time, sender_nick, message)
    
    if currently_playing?
      
      reply "#{current_track[:artist]} ~ #{current_track[:track]}"
      
    else
      
    end
    
    
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