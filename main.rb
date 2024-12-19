# frozen_string_literal: true

require_relative 'lib/hashmap'
require_relative 'lib/linked_list'
require_relative 'lib/node'

# hm = HashMap.new
# hm.set('sj', 'shrek_jack')
# hm.set('sj', 'waawaaweewa')
# hm.set('cz', 'wassup?')
# hm.set('sk', 'sdfru')
# hm.set('sg', 'regwqwu')
# puts hm
# pp "length : #{hm.length}"

# pp "get : #{hm.get('cz')}"
# pp "get : #{hm.get('sj')}"
# pp "get : #{hm.get('sr')}"

# pp "has? : #{hm.has?('sr')}"
# pp "has? : #{hm.has?('sj')}"

# pp 'remove : '
# pp hm.remove('sj')
# pp "remove : #{hm.remove('sr')}"

# puts hm

# pp "length : #{hm.length}"

# # pp 'clear :'
# # pp hm.clear

# puts hm

# pp 'keys :'
# pp hm.keys
# pp 'values :'
# pp hm.values
# pp 'entries'
# pp hm.entries

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts test

test.set('jacket', 'red')

puts test
