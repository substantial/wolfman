require 'spec_helper'

require 'jukebox'
describe Wolfman::Jukebox do
  let(:playing_result){
       %{Cults - Most Wanted
[playing] #1/1   0:00/3:05 (0%)
volume: n/a   repeat: off   random: off   single: off   consume: off
}
  }
  context 'displaying currently playing track' do
    before do
      stub_playing
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

  describe '#currently_playing?' do
    subject { Wolfman::Jukebox.currently_playing? }
    context 'when paused' do
      before { stub_paused }
      it{ should_not be}
    end

    context 'when playing' do
      before { stub_playing }
      it{ should be}
    end
  end


  def stub_playing
    Wolfman::Jukebox.stub(:mpc_result){playing_result}
  end

  def stub_paused
    Wolfman::Jukebox.stub(:mpc_result){""}
  end
end
