require 'spec_helper'
require 'guard/rocco'
require 'fileutils'

describe Guard::Rocco do
  let(:doc_dir) { 'spec/doc' }

  before do
    FileUtils.rm_rf doc_dir
    FileUtils.mkdir_p doc_dir
  end

  after do
    FileUtils.rm_rf doc_dir
  end

  let(:guard) { Guard::Rocco.new([], options) }
  let(:filename) { 'lib/guard/rocco.rb' }
  let(:options) { { :dir => doc_dir } }

  describe '#run_all' do
    let(:options) { { :dir => doc_dir, :run_on => [ :all ] } }

    before do
      guard.stubs(:all_paths).returns([filename])
    end

    it 'should generate the docs' do
      guard.run_all

      File.file?(File.join(doc_dir, 'lib/guard/rocco.html')).should be_true
    end
  end

  describe '#run_on_change' do
    it 'should generate the doc' do
      guard.run_on_change([filename])

      File.file?(File.join(doc_dir, 'lib/guard/rocco.html')).should be_true
    end
  end
  
  describe 'run options' do
    it 'should allow array of symbols' do
      guard = Guard::Rocco.new([], :run_on => [:start, :change])
      guard.send(:run_for?, :start).should be_true
      guard.send(:run_for?, :reload).should be_false
    end

    it 'should allow symbol' do
      guard = Guard::Rocco.new([], :run_on => :start)
      guard.send(:run_for?, :start).should be_true
      guard.send(:run_for?, :reload).should be_false
    end
  end
end

