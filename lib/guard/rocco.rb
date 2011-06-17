require 'rocco'
require 'guard/guard'

module Guard
  class Rocco < Guard
    def initialize(watchers = [], options = {})
      super

      @options = { :dir => 'doc' }.merge(options)
    end

    def start
      UI.info "Guard::Rocco is waiting to build docs..."
    end

    def run_all
      all_paths.each { |path| build(path) }
    end

    def run_on_change(paths = [])
      paths.each { |path| build(path) }
    end

    private
    def build(path)
      target = File.join(@options[:dir], path).gsub(%r{\.[^\.]+$}, '.html')
      puts "rocco: #{path} -> #{target}"
      File.open(target, 'wb') { |fh| fh.print ::Rocco.new(path, all_paths).to_html }
    end

    def all_paths
      Watcher.match_files(self, Dir['**/*'])
    end
  end
end

