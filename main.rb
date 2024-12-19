# frozen_string_literal: true

require_relative 'lib/hashmap'
require_relative 'lib/linked_list'
require_relative 'lib/node'

hm = HashMap.new
hm.set('sj', 'shrek_jack')
hm.set('sj', 'waawaaweewa')
hm.set('cz', 'wassup?')
puts hm
pp "get : #{hm.get('cz')}"
pp "get : #{hm.get('sj')}"
pp "get : #{hm.get('sr')}"

pp "has? : #{hm.has?('sr')}"
pp "has? : #{hm.has?('sj')}"

pp 'remove : '
pp hm.remove('sj')
pp "remove : #{hm.remove('sr')}"

puts hm
