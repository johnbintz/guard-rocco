It's a [Guard](http://github.com/guard/guard) for the [Rocco](http://github.com/rtomayko/rocco) documentation system!

    guard 'rocco' do
      watch(%r{app/.*\.(rb|coffee)})
      watch(%r{lib/.*\.rb})
    end

Only one option for now:

* `:dir` specifies the output dir (default `doc`)

`gem install guard-rocco` or Bundle it up with `gem 'guard-rocco'`. Then `guard init rocco`. Yeah!

