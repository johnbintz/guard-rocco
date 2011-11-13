It's a [Guard](http://github.com/guard/guard) for the [Rocco](http://github.com/rtomayko/rocco) documentation system!

``` ruby
# default values
guard 'rocco', :run_all => [:start, :change], :dir => 'doc', :stylesheet => 'http://jashkenas.github.com/docco/resources/docco.css' do
  watch(%r{^app/.*\.(rb|coffee)$})
  watch(%r{^lib/.*\.rb$})
end
```
Options:

* `:run_on` specifies when to update the docs
  * `:start` - run on all documentation when the guard starts
  * `:change` - run when watched files change
  * `:reload` - run when the guard is reloaded
  * `:all` - run when running all the guards
* `:dir` specifies the output dir
* `:stylesheet` specifies a custom stylesheet to use

`gem install guard-rocco` or Bundle it up with `gem 'guard-rocco'`. Then `guard init rocco`. Yeah!

