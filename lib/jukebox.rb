module Wolfman
  module Jukebox
    extend self
    
    def currently_playing?
      true
    end
    
    def current_track
      data = `mpc`
      data.split("\n").first.gsub(/-/,'~')
    end

    def skip_track
      system 'mpc next'
    end
  end
end
