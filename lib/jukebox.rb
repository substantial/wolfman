module Wolfman
  module Jukebox
    extend self
    
    def currently_playing?
      mpc_result =~ /playing/m
    end
    
    def current_track
      data = mpc_result
      data.split("\n").first.gsub(/-/,'~')
    end

    def skip_track
      system 'mpc next'
    end

    def mpc_result
      `mpc`
    end
  end
end
