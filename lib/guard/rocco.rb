require 'rocco'
require 'guard'
require 'guard/guard'
require 'guard/watcher'
require 'fileutils'

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
    def build(path, target = nil)
      target ||= filename_to_target(path)
      puts "rocco: #{path} -> #{target}"
      FileUtils.mkdir_p File.split(target).first
      File.open(target, 'wb') do |fh|
        fh.print ::Rocco.new(path, all_paths, rocco_options).to_html
      end
    end

    def all_paths
      Watcher.match_files(self, Dir['**/*'])
    end

    def filename_to_target(path)
      File.join(@options[:dir], path).gsub(%r{\.[^\.]+$}, '.html')
    end

    def rocco_options
      opts = @options.dup
      opts.delete(:dir)
      opts
    end
  end
end

