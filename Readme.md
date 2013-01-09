# Cielle

##### Because, why not stay up all night and write a programming language named after your mom.

`Cielle` is long for `C, L`, which is short for `Cindy Leaver`.

The file extension for `Cielle` is `.cl`

### Why?

Writing a programming language is easy. You don't even really have to come up with new ideas.

Great tools exist for Parsing Expression Grammars exist. Writing a decent parser for a language
isn't a big deal.

### How?

The treetop PEG tool.

### What?

* indentation aware ( python, coffeescript )
* strictly message passing, (almost) no keywords
* blocks and block arguments
* argument splats
* default arguments
* quoted arguments
* compile to coffeescript/javascript/ruby source
* classes
* modules

### Is it any good?

nope

### Do you love your mother?

yep

### Then why isn't this any good?

touche


## this might mean something... might not
```io
method class *name superclass=Object &implementation
  method method *name arguments... &implementation
    add_member methods name arguments &implementation

  method alias from to
    add_member methods from (read_member methods to)

  method new
    allocate 
    initialize

  method allocate
    # stub

  method initialize
    # stub

class Object
  method if test options
    #IF RUBY
      `if test
        #{compile options[:do]}
      else
        #{compile options[:else]}
      end`

    #IF COFFEE
      `if test
        #{compile options.do}
      else
        #{compile options.else}`

  method is other
    #IF RUBY
      `self == other`
    #IF COFFEE
      `this is other`

  method isnt other
    #IF RUBY
      `self !== other`
    #IF COFFEE
      `this isnt other`  

  method add_member slot key value
    #IF RUBY || COFFEE
      `(@#{slot} ||= {})[key] = value`

  method read_member slot key
    #IF RUBY || COFFEE
      `(@#{slot} ||= {})[key]`

  method push_item slot item
    #IF RUBY || COFFEE
      `(@#{slot} ||= [])[key].push value`

  method pop_item slot
    #IF RUBY || COFFEE
      `(@#{slot} ||= [])[key].pop()`

  method peek_item slot index=0
    #IF RUBY || COFFEE
      `(@#{slot} ||= [])[key][index]`

  method first slot
    peek_item slot 0

  method last slot
    #IF RUBY || COFFEE
      `(list = @#{slot} ||= [])[key][list.length - 1]`

  method each_item &block
    #IF RUBY || COFFEE
      `list = @#{slot} ||= []`
    #IF RUBY
      `list.each_with_index &block`
    #IF COFFEE
     `block.call(this, item, index) for item, index in list`

  method each_member &block
    #IF RUBY || COFFEE
      `map = @#{slot} ||= {}`
    #IF RUBY
      `map.each &block`
    #IF COFFEE
     `block.call(this, key, value) for key, value of map`

```