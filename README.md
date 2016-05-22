# Ruby Helper for Alfred 3 Workflows

[![Latest Version](https://img.shields.io/github/tag/joetannenbaum/alfred-workflow-ruby.svg?style=flat&label=release)](https://github.com/joetannenbaum/alfred-workflow-ruby/tags)
[![Build Status](https://travis-ci.org/joetannenbaum/alfred-workflow-ruby.svg?branch=master)](https://travis-ci.org/joetannenbaum/alfred-workflow-ruby)

This package simplifies Ruby development for **Alfred 3** workflows.

## Installation

```
gem install alfred-3_workflow
```

## Usage

To understand the following properties, please reference the [official Alfred 3 documentation](https://www.alfredapp.com/help/workflows/inputs/script-filter/json/).

The library is not doing any validation for required properties, so all of the following are optional. Please refer to the documentation above for required properties. All of the properties will default to the official defaults if excluded.

```ruby
require 'alfred-3_workflow'

workflow = Alfred3::workflow.new

workflow.result
        .uid('bob-belcher')
        .title('Bob')
        .subtitle('Head Burger Chef')
        .quicklookurl('http://www.bobsburgers.com')
        .type('default')
        .arg('bob')
        .valid(true)
        .icon('bob.png')
        .mod('cmd', 'Search for Bob', 'search')
        .text('copy', 'Bob is the best!')
        .autocomplete('Bob Belcher')

workflow.result
        .uid('linda-belcher')
        .title('Linda')
        .subtitle('Wife')
        .quicklookurl('http://www.bobsburgers.com')
        .type('default')
        .arg('linda')
        .valid(true)
        .icon('linda.png')
        .mod('cmd', 'Search for Linda', 'search')
        .text('largetype', 'Linda is the best!')
        .autocomplete('Linda Belcher')

print workflow.output
```

Results in:

```json
{
  "items": [
    {
      "arg": "bob",
      "autocomplete": "Bob Belcher",
      "icon": {
        "path": "bob.png"
      },
      "mods": {
        "cmd": {
          "subtitle": "Search for Bob",
          "arg": "search",
          "valid": true
        }
      },
      "quicklookurl": "http://www.bobsburgers.com",
      "subtitle": "Head Burger Chef",
      "text": {
        "copy": "Bob is the best!"
      },
      "title": "Bob",
      "type": "default",
      "uid": "bob-belcher",
      "valid": true
    },
    {
      "arg": "linda",
      "autocomplete": "Linda Belcher",
      "icon": {
        "path": "linda.png"
      },
      "mods": {
        "cmd": {
          "subtitle": "Search for Linda",
          "arg": "search",
          "valid": true
        }
      },
      "quicklookurl": "http://www.bobsburgers.com",
      "subtitle": "Wife",
      "text": {
        "largetype": "LINDA IS THE BEST!"
      },
      "title": "Linda",
      "type": "default",
      "uid": "linda-belcher",
      "valid": true
    }
  ]
}
```

## Helper Methods

Just for clarity, some helper methods exist.

```ruby
# This...
workflow.result.mod('cmd', 'Search for Bob', 'search')
# ...is the same as this.
workflow.result.cmd('Search for Bob', 'search')
# And these are all available as well:
workflow.result.shift('Search for Bob', 'search')
workflow.result.fn('Search for Bob', 'search')
workflow.result.ctrl('Search for Bob', 'search')
workflow.result.alt('Search for Bob', 'search')
```

```ruby
# This...
workflow.result.text('largetype', 'Linda is the best!')
# ...is the same as this.
workflow.result.largetype('Linda is the best!')
# Also works:
workflow.result.copy('Linda is the best!')
```

```ruby
# This...
workflow.result.icon('bob.png', 'fileicon')
# ...is the same as this.
workflow.result.fileicon_icon('bob.png')
# Also works:
workflow.result.filetype_icon('bob.png')
```

## Sorting

If you'd like to sort your results:

```ruby
# Default is by title asc:
workflow.sort_results
# Title desc:
workflow.sort_results('desc')
# By property asc:
workflow.sort_results('asc', 'subtitle')
```

## Filtering

You can filter your results as well if Alfred isn't doing it for you:

**Please note** this is a very simple filtering, literally looking for the string within the string. For anything more complex filter before creating results.

```ruby
# Default is searching in title:
workflow.filter_results('bob')
# By property:
workflow.filter_results('bob', 'subtitle')
```
