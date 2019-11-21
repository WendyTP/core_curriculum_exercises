=begin
requirement:
  - create buffer (different size of array)
  -  push in (write) and remove (read) data in buffer
  - overwrite witrh "A" and "B"
  - raise empty (when read) and fulll (when write) buffer exception
data: 
["1","2"]
=end

class CircularBuffer

  class BufferEmptyException < StandardError ; end
  class BufferFullException < StandardError ; end

  attr_reader :buffer_size, :buffer

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @buffer = Array.new
  end

  def read
    # remove and return the most ancient item in the buffer (arr)
    # raise empty exception if no item in array
    if buffer.empty?
      raise BufferEmptyException, "buffer is empty!"
    else
      buffer.shift
    end

  end

  def write(item)
    # push in new item in the buffer (arr)
    # raise full execption if arr is full
    # can only write in string integers and "A" and "B" --> nil won't write in
    return buffer unless valid_data?(item)
    raise BufferFullException, "buffer is full!" if buffer.size == buffer_size
    buffer << item

  end

  def write!(item)
    # force write string integers to non full buffer == write method
    # force write "A" / "B" to full buffer -> remove ancient item and add "A"/ "B"
   return buffer unless valid_data?(item)
   if buffer.size == buffer_size
    self.read
    self.write(item)
   else
    self.write(item)
   end
  end

  def clear
    # remove all items in the buffer
    buffer.clear
  end

  def valid_data?(item)
    item.is_a?(String) && item.match(/\A(\d*|[AB])\z/)
  end
end
