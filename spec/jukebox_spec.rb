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

  context 'skipping the track' do
    it 'should send the correct command to mpc' do
      Wolfman::Jukebox.should_receive(:system).with('mpc next')
      Wolfman::Jukebox.skip_track
    end
  end

end
