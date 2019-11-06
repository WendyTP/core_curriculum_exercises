=begin
#1. listening for something: 
    pass in a sentence via block for the sentence being said
    record it
    return the sentence 
    otherwise
    return nil
#2. play:
    display the sentences recorded in recordings
  end


=end

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    if block_given?
      recording = yield
      record(recording)
    else
      return
    end
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
#listener.record("hello world")
#listener.record("hi there")
p listener.listen {"Hello world!!"}
p listener.listen
p listener.listen {"this is last recording"}
listener.play