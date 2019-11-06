class CircularQueue
  private

  attr_reader :array, :buffer_size

  public

  def initialize(buffer_size)
    @array = Array.new
    @buffer_size = buffer_size
  end

  def enqueue(obj)
    if array.size < buffer_size
      array.push(obj)
    elsif array.size == buffer_size
      self.dequeue
      array.push(obj)
    end
  end

  def dequeue
    if array.empty?
      return nil
    else
    array.shift
    end
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil


