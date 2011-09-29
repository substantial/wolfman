
module Spotify
  
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
  
  def skip_track
    nil
  end
  
end