# frozen_string_literal: true

# Hash map data structure with help of array and LinkedList
#   @instance_variables -
#   1. load_factor - determine when it is a good time to grow our buckets
#   2. capacity - total number of buckets we currently have.
class HashMap
  def initialize
    @capacity = 16
    @load_factor = 0.75
    @buckets = Array.new(@capacity)
  end

  # generates hash codes for key
  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code
  end
end
