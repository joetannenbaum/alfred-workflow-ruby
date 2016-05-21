require 'workflow'
require 'result'
require 'json'

workflow = Workflow.new

workflow.result()
                .subtitle('Head Burger Chef')
                .type('default')
                .icon('bob.png')
                .mod('cmd', 'Search for Bob', 'search')
                .uid('bob-belcher')
                .title('Bob')
                .quicklookurl('http://www.bobsburgers.com')
                .arg('bob')
                .autocomplete('Bob Belcher')
                .valid(true)
                # .text('copy', 'Bob is the best!')
                # .shift('New thing', 'new-thing')

puts workflow.output
