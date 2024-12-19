# frozen_string_literal: true

require_relative 'lib/hashmap'
require_relative 'lib/linked_list'
require_relative 'lib/node'

hm = HashMap.new
hm.set('sj', 'shrek_jack')
hm.set('cz', 'wassup?')
puts hm
pp hm.get('cz')
pp hm.get('sj')
pp hm.get('sr')
