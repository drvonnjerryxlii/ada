namespacing: wrapping a super common word (quantity, tax, inventory, total,
sale, etc) into a less commonly named package.


`module FarMar
  class Sale
    def initialize
     # code here
    end
  end
end`

to call that, you say:
`x = FarMar::Sale.new`

we have a module by the name of FarMar that contains a class named Sale.
we will new up Sale and assign it to x.


most gems are packages of classes organized inside a module namespace. some are
packages of multiple modules / namespaces.
* you can put a module inside a module.


__load path__ is a set of directories that ruby is aware of.
* the method dispatch - when you ask for a method, there is an order in which it
  looks for that method.
* when we require a gem, what we're actually doing is say, hey, require this in
  your load path.
   * when you require a gem, all you're doing is making the code aware of the
     module. in colorize, the method will call extended on strings.

a terrible thing to do with module:

`module ArraysForJeremy`  
`..def length`  
`....super() + 1`  
`..end`

`..def how_many_tacos_should_we_order`  
`....size ** 2`  
`..end`  
`end`  

`jeremyArray = [1, 2, 3, 4, 5]`  
`puts "*" * 20`  
`puts "SIZE: #{ jeremyArray.length }"`  
`puts "*" * 20`  

`jeremyArray.extend(ArraysForJeremy)`

`puts "*" * 20`  
`puts "SIZE: #{ jeremyArray.length }"`  
`puts "*" * 20`  

`puts "*" * 20`  
`puts "TACOS: #{ jeremyArray.how_many_tacos_should_we_order }"`  
`puts "*" * 20`  
