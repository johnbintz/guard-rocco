It's a [Guard](http://github.com/guard/guard) for the [Rocco](http://github.com/rtomayko/rocco) documentation system!

    guard 'rocco' do
      watch(%r{^app/.*\.(rb|coffee)$})
      watch(%r{^lib/.*\.rb$})
    end

Options:

* `:dir` specifies the output dir (default `doc`)
* `:stylesheet` specifies a custom stylesheet to use (default is
  http://jashkenas.github.com/docco/resources/docco.css)

`gem install guard-rocco` or Bundle it up with `gem 'guard-rocco'`. Then `guard init rocco`. Yeah!

