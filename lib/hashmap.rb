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

  # prints the hashmap in a more readable format
  def to_s
    string = String.new
    string << "Hashmap : \n"
    @buckets.each_with_index do |elem, index|
      string << "#{index} :" << elem.to_s << "\n"
    end
    string << "capacity : #{@capacity}\nload_factor : #{@load_factor}"
  end

  # set's a key and it's value in a bucket, if the key already exists updates the value
  def set(key, value) # rubocop:disable Metrics/MethodLength
    # pp "key : #{key}"
    # pp "value : #{value}"
    index = hash(key) % @capacity
    # pp "index : #{index}"
    check_index(index)
    # pp "bucket : #{@buckets[index]}"

    if @buckets[index].nil?
      linked_list = LinkedList.new
      linked_list.append(key, value)
      # pp linked_list
      @buckets[index] = linked_list
    elsif (key_index = @buckets[index].find_key_index(key))
      # pp @buckets[index]
      # pp "key_index : #{key_index}"
      @buckets[index].at(key_index).value = value
    else
      # pp "bucket : #{@buckets[index]}"
      @buckets[index].append(key, value)
    end
    # pp "bucket : #{@buckets[index]}"
  end

  # checks if index is in range 0<= index < @capacity
  def check_index(index)
    raise IndexError if index.negative? || index >= @buckets.length
  end

  # get value of a key
  def get(key)
    index = hash(key) % @capacity
    linked_list = @buckets[index]

    return nil if linked_list.nil?

    key_index = linked_list.find_key_index(key)
    linked_list.at(key_index).value
  end

  # returns true if hashmap contains the key else false
  def has?(key)
    index = hash(key) % @capacity
    return false if @buckets[index].nil?

    @buckets[index].contains_key?(key)
  end

  # removes the key returns the value of the deleted key ,returns nil if not found.
  def remove(key)
    return nil unless has?(key)

    index = hash(key) % @capacity
    linked_list = @buckets[index]
    key_index = linked_list.find_key_index(key)
    node = linked_list.at(key_index)
    linked_list.remove_at(key_index)
    node.value
  end
end
