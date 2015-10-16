$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'taiwan_tours/version'

Gem::Specification.new do |s|
  s.name        =  'taiwan_tours'
  s.version     =  LonelyPlanetScrape::VERSION
  s.date        =  LonelyPlanetScrape::DATE
  s.executables << 'taiwan_tours'
  s.summary     =  'The lonelyplanet web scraper service traverses details of Taiwan tour packages'
  s.description =  'Get deatils of taiwan tours packages'
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
