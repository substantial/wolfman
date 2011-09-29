require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Robut::Plugin::TrackReporting do
  
  subject { Robut::Plugin::TrackReporting.new "no-connection" }
  
  context "when asked 'what is playing', 'what's playing', or 'playing'" do
    
    context "when music is playing" do
      
      before :each do
        subject.stub!(:currently_playing?).and_return(:true)
        subject.stub!(:current_track).and_return(
          :artist => 'Prince', :album => 'Diamonds and Pearls', :track => 'Something Funky This House Comes')
        subject.stub!(:reply).with("Prince ~ Something Funky This House Comes")
      end
      
      [ "what is playing", "what's playing", "playing" ].each do |message|

        it "should reply with the current playing track" do
          
          subject.should_receive(:reply).with("Prince ~ Something Funky This House Comes")
          
          subject.handle("Time","caller",message)

        end
        
      end
      
    end
    
  end
  
end
