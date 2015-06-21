class Stack
  def initialize(size)
    @store = Array.new
    @size = size
  end

  def pop
    unless empty?
      @store.pop()
    else
      return nil
    end
  end

  def push(element)
    unless full? || element.nil?
      @store.push(element)
      self
    else
      return nil
    end
  end

  def size
    @size
  end

  def look
    @store.last
  end

  private

  def full?
    @size == @store.length
  end

  def empty?
    @store.length == 0
  end
end
