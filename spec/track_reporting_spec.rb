require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Robut::Plugin::TrackReporting do
  
  subject { Robut::Plugin::TrackReporting.new "no-connection" }
  
  context "when asked 'what is playing', 'what's playing', or 'playing'" do
    
    context "when music is playing" do
      
      before :each do
        subject.stub(:currently_playing?) { true }
        subject.stub(:current_track) { 
          { :artist => 'Prince', :album => 'Diamonds and Pearls', :track => 'Something Funky This House Comes' }
        }
      end
      
      [ "what is playing?", "what's playing", "playing" ].each do |message|
        
        it "should reply with the current playing track" do
          subject.should_receive(:reply).with("Prince ~ Something Funky This House Comes")
          subject.handle(Time.now,"caller",message)
        end
        
      end
      
    end
    
    context "when music is not playing" do
      
      before :each do
        subject.stub(:currently_playing?) { false }
      end
      
      [ "what is playing?", "what's playing", "playing" ].each do |message|
        
        it "should reply that no music is playing" do
          subject.should_receive(:reply).with("No Music Is Playing")
          subject.handle(Time.now,"caller",message)
        end
        
      end

    end
    
  end
  
  context "when asked something that is not a valid request" do
    
    [ 'anything else' ].each do |message|
      
      it "should not respond" do
        
        subject.should_not_receive(:reply)
        subject.handle(Time.now,"caller",message)
        
      end
      
    end
    
  end
  
end
