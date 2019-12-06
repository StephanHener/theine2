require 'yaml'

if Gem::Specification::find_all_by_name('pry').any?
  require 'pry'
  if Gem::Specification::find_all_by_name('pry-nav').any?
    require 'pry-nav'
  end
end

module Theine
  class ConfigReader
    attr_reader :rails_root
    attr_accessor :base_port, :max_port, :min_free_workers, :spawn_parallel, :silent
    def initialize(rails_root)
      @rails_root = rails_root
      @base_port = 11000
      @max_port = 11100
      @min_free_workers = 2
      @spawn_parallel = true
      @silent = false
      load_config(File.expand_path("~/.theine"))
      load_config("#{rails_root}/.theine")
    end

    def load_config(path)
      if File.exist?(path)
        config = YAML.load(File.read(path))
        config.each_pair do |k, v|
          setter = :"#{k}="
          send(setter, v) if respond_to?(setter)
        end
      end
    end
  end
end