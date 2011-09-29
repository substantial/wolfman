module Wolfman
  module Jukebox
    extend self

    def current_track
      data = system 'mpc'
      data.split("\n").first.gsub(/-/,'~')
    end

  end
end
