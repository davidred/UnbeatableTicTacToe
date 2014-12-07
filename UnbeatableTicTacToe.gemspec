Gem::Specification.new do |gem|
  gem.name = "UnbeatableTicTacToe"
  unless ENV['TRAVIS']
    gem.version = "0.0.0"
  else
    if ENV['TRAVIS_TAG'] == "" then gem.version = ENV['TRAVIS_BUILD_ID']
    else
      gem.version = ENV['TRAVIS_TAG']
    end
  end
  gem.author = "David Rozenberg"
  gem.email = "davidred@users.noreply.github.com"
  gem.description = <<DES
Well that doesn't sound fun... but there are 3 play modes:

Play against another human player
Play against a "dumb" computer
Play against the unbeatable computer (The best you'll do is tie)
DES
  gem.summary = "Play an unbeatable supercomputer in this terminal Tic Tac Toe game written in Ruby"
  gem.files = Dir.glob "lib/*.rb"
  gem.executables << 'UnbeatableTicTacToe'
  gem.extra_rdoc_files = Dir.glob ".md"
end
  
