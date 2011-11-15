require 'rocco'
require 'guard'
require 'guard/guard'
require 'guard/watcher'
require 'fileutils'

module Guard
  class Rocco < Guard
    def initialize(watchers = [], options = {})
      super

      @options = options || {}

      @dir = @options[:dir] || 'doc'
      @run_on = @options[:run_on] || [:start, :change]
      @run_on = [@run_on] unless @run_on.respond_to?(:include?)
    end

    def start
      all_paths.each { |path| build(path) } if run_for? :start
    end

    def reload
      all_paths.each { |path| build(path) } if run_for? :reload
    end

    def run_all
      all_paths.each { |path| build(path) } if run_for? :all
    end

    def run_on_change(paths = [])
      paths.each { |path| build(path) } if run_for? :change
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
      File.join(@dir, path).gsub(%r{\.[^\.]+$}, '.html')
    end

    def rocco_options
      opts = @options.dup
      opts.delete(:dir)
      opts.delete(:run_on)
      opts
    end

    def run_for? command
      @run_on.include?(command)
    end
  end
end
