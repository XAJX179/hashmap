# frozen_string_literal: true

# class LinkedList for creating linked list with help of Node class's objects
class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    # head/start of the list
    @head = nil
    # tail/end of the list
    @tail = nil
    # total number of nodes in the list
    @size = 0
  end

  # appends value at the end of the list
  def append(key, value)
    node = Node.new(key, value)

    if @head.nil?
      @head = node
    else
      @tail.next = node
    end
    @tail = node
    @size += 1
  end

  # prepends value at the top of the list
  def prepend(key, value)
    node = Node.new(key, value)

    if @head.nil?
      @tail = node
    else
      node.next = @head
    end
    @head = node
    @size += 1
  end

  # including this means every method that uses each to work is copied here
  # and will become useful by using below modified each method
  include Enumerable
  # iterates over each node of the list and calls the block on it
  def each
    return nil if @head.nil?

    pointer = @head
    index = 0
    until pointer.nil?
      yield(pointer, index)
      pointer = pointer.next
      index += 1
    end
  end

  # return node of the list at the given index start from 0
  def at(index)
    return nil if index >= size || index.negative?

    node, _node_index = detect { |_node, node_index| node_index == index }
    node
  end

  # removes last element of the list
  def pop
    return nil if @head.nil?

    if @head == @tail
      @head = nil
      @tail = nil
    else
      before_tail = at size - 2
      before_tail.next = nil
      @tail = before_tail
    end
    @size -= 1
  end

  # returns true if a node with given key exists in list else returns false.
  def contains_key?(key)
    any? { |node, _node_index| node.key == key }
  end

  # finds index of the node with key equals given key
  def find_key_index(key)
    find_index { |node, _node_index| node.key == key }
  end

  # prints list in a readable format
  def to_s
    string = String.new
    each { |elem| string << "( #{elem.key} : #{elem.value} )->" }
    string << '( nil )'
  end

  # inserts node with given key and value at index
  def insert_at(key, value, index)
    list_size = size
    return 'only positive index' if index.negative? || index > list_size

    node = Node.new(key, value)
    if index.zero?
      prepend(key, value)
    elsif index == list_size - 1
      append(key, value)
    else
      insert(index, node)
    end
  end

  # insert_at's insert method for inserting node in between
  # list with given index
  def insert(index, node)
    # current node at the index
    current_node = at(index)
    # previous node from the index
    previous_node = at(index - 1)
    # pp current_node
    # pp previous_node
    node.next = current_node
    previous_node.next = node
    @size += 1
  end

  # removes element at a given index
  def remove_at(index)
    return nil if at(index).nil?

    if index == size - 1
      pop
    elsif index.zero?
      @head = @head.next
    else
      remove(index)
    end
    @size -= 1
  end

  # used to remove any element between but not including head and tail
  def remove(index)
    previous_node = at(index - 1)
    next_node = at(index + 1)
    previous_node.next = next_node
  end
end
