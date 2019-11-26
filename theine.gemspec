Gem::Specification.new do |s|
  s.name        = 'theine2'
  s.version     = '1.0.0'
  s.summary     = "Theine2"
  s.description = "A Rails preloader for JRuby"
  s.authors     = ["Jan Berdajs", "Ron Williams"]
  s.email       = 'ron.a.williams@gmail.com'
  s.files       = ["lib/theine.rb", "lib/theine/client.rb",
                   "lib/theine/server.rb", "lib/theine/worker.rb",
                   "lib/theine/config.rb"]
  s.executables << 'theine'
  s.executables << 'theine_current_ruby'
  s.executables << 'theine_server'
  s.executables << 'theine_set_ruby'
  s.homepage    = 'https://github.com/rwilliams/theine2'
  s.license     = 'MIT'
end
