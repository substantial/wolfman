require 'spec_helper'

require 'jukebox'
describe Wolfman::Jukebox do
  context 'displaying currently playing track' do
    before do
      Wolfman::Jukebox.stub(:system).with(/^mpc$/){
      %{Cults - Most Wanted
[playing] #1/1   0:00/3:05 (0%)
volume: n/a   repeat: off   random: off   single: off   consume: off
}}
    end

    it 'should return the album and artist' do
      Wolfman::Jukebox.current_track.should == 'Cults ~ Most Wanted'
    end
  end

end
