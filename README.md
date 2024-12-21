# Hashmap

A hashmap is a data structure which takes in a key value pair, produces a hash code from key, determines index based on capacity, and stores the pair in the bucket at the index, and it grows based on the load_factor to avoid collisions and uses linked_list to store multiple values in same buckets when necessary.

## Buckets

An array to store the linked_lists with nodes containing key and values

## Collisions

Collisions are when more than one keys gets the same index

## Capacity

Current total buckets available (length of the array)

## Load_factor

This value helps decide when to grow our hashmap when certain percent of buckets are full as to avoid collisions.

## Linked_list

A linear data structure where each node points to the next node.

### methods

- #hash(key)
- #set(key,value)
- #to_s
- #get(key)
- #remove(key)
- #has?(key)
- #length
- #clear
- #keys
- #values
- #entries

