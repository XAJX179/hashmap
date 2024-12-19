# frozen_string_literal: true

# class Node for creating node objects
class Node
  attr_accessor :key, :value, :next

  def initialize(key = nil, value = nil, next_pointer = nil)
    # stored key of the node
    @key = key
    # stored value of the node
    @value = value
    # pointer to next node in list
    @next = next_pointer
  end
end
