# frozen_string_literal: true

# Hash map data structure with help of array and LinkedList
#   @instance_variables -
#   1. load_factor - determine when it is a good time to grow our buckets
#   2. capacity - total number of buckets we currently have.
class HashMap
  attr_reader :buckets

  def initialize(capacity = 16, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
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
    @buckets.each_with_index { |elem, index| string << "#{index} : #{elem} \n" }
    string << "capacity : #{@capacity}\nload_factor : #{@load_factor}"
  end

  # set's a key and it's value in a bucket, if the key already exists updates the value
  def set(key, value)
    index = hash(key) % @capacity
    check_index(index)

    if @buckets[index].nil?

      new_list(key, value, index)

    elsif (key_index = @buckets[index].find_key_index(key))

      @buckets[index].at(key_index).value = value

    else
      @buckets[index].append(key, value)
    end
    grow if high_load?
  end

  # when nil is found in bucket this creates new list for set method
  def new_list(key, value, index)
    linked_list = LinkedList.new
    linked_list.append(key, value)
    @buckets[index] = linked_list
  end

  # check if length exceeds the load level
  def high_load?
    length > @capacity * @load_factor
  end

  # grow buckets
  def grow
    @capacity *= 2
    hm = HashMap.new(@capacity)
    entries.each { |key, value| hm.set(key, value) }
    @buckets = hm.buckets
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

  # returns the number of keys present.
  def length
    length = 0
    @buckets.each do |elem|
      length += elem.size unless elem.nil?
    end
    length
  end

  def clear
    @capacity = 16
    @buckets = Array.new(@capacity)
    'Buckets cleared'
  end

  def keys
    keys = []
    @buckets.each do |elem|
      next if elem.nil?

      elem.each { |node| keys << node.key }
    end
    keys
  end

  def values
    values = []
    @buckets.each do |elem|
      next if elem.nil?

      elem.each { |node| values << node.value }
    end
    values
  end

  def entries
    entries = []
    @buckets.each do |elem|
      next if elem.nil?

      elem.each { |node| entries << [node.key, node.value] }
    end
    entries
  end
end
