require_relative 'spec_helper'

describe Robut::Plugin::TrackReporting do
  
  subject { 
    connection = double("connection")
    connection.stub_chain(:config, :nick) { "wolfman" }
    Robut::Plugin::TrackReporting.new connection 
  }
  
  context "when asked 'what is playing', 'what's playing', or 'playing'" do
    
    context "when music is playing" do
      
      before :each do
        subject.stub(:currently_playing?) { true }
        subject.stub(:current_track) { 'Prince ~ Something Funky This House Comes' }
      end
      
      [ "@wolfman what is playing?", "@wolfman what's playing", "@wolfman playing" ].each do |message|
        
        it "should reply with the current playing track" do
          subject.should_receive(:reply).with("(chewie): Prince ~ Something Funky This House Comes")
          subject.handle(Time.now,"caller",message)
        end
        
      end
      
    end
    
    context "when music is not playing" do
      
      before :each do
        subject.stub(:currently_playing?) { false }
      end
      
      [ "@wolfman what is playing?", "@wolfman what's playing", "@wolfman playing" ].each do |message|
        
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
