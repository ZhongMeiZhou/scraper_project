$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'lonely_planet/version'

Gem::Specification.new do |s|
  s.name        =  'lonely_planet_tours'
  s.version     =  LonelyPlanetScrape::VERSION
  s.date        =  LonelyPlanetScrape::DATE
  s.executables << 'lonely_planet_tours'
  s.summary     =  'The lonelyplanet web scraper service traverses details of tour packages based on specified country'
  s.description =  'Get listings of tour packages from Lonelyplanet'
  s.authors     =  ['Bayardo Salgado', 'Cesar Ordoñez','Eduardo Salazar','Nicole Weatherburne']
  s.email       =  ['bayardo_salgado@yahoo.com','cesar','esalazar922@gmail.com','nikkiweat@gmail.com']
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files spec/*`.split("\n")
  s.homepage    =  'https://github.com/ZhongMeiZhou/scraper_project'
  s.license     =  'MIT'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_runtime_dependency 'oga'
  s.add_runtime_dependency 'json'
end
