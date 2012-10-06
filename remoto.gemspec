# encoding: utf-8

Gem::Specification.new do |s|
  s.name              = "remoto"
  s.version           = "0.0.2"
  s.summary           = "Remote control for browsers"
  s.description       = "Remoto controls browsers that accept javascript via TCP, like Firefox with the RemoteControl add-on."
  s.authors           = ["Michel Martens"]
  s.email             = ["michel@soveran.com"]
  s.homepage          = "http://soveran.com/"
  s.files             = ["README.md", "LICENSE", "bin/remoto", "lib/remoto.rb", "test/remoto_test.rb", "makefile"]
  s.license           = "MIT"

  s.executables.push("remoto")
  s.add_dependency("clap")
  s.add_dependency("cuba")
  s.add_development_dependency("cutest")
end
