class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @next.prev = @prev
    @prev.next = @next
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.prev = @tail
    @tail.next = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.prev
  end

  def last
    @tail.next
  end

  def empty?
    @head.prev == @tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    to_append = Node.new(key, val)

    to_append.next = @tail.next
    @tail.next.prev = to_append
    @tail.next = to_append
  end

  def update(key, val)
    curr_node = @head

    while curr_node.key != key
      return false if curr_node.next == nil
      curr_node = curr_node.next
      if curr_node.key == key
        curr_node.val = val
        curr_node.next.prev = curr_node.prev
        curr_node.prev.next = curr_node.next

        curr_node.prev = @head.prev
        @head.prev.next = curr_node
        @head.prev = curr_node
        curr_node.next = @head
      end

    end
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
