Gem::Specification.new do |s|
    s.name        = 'rsaa'
    s.version     = '0.0.6'
    s.summary     = "Simple implementation of the RSA algorithm"
    s.description = ""
    s.authors     = ["Dayan Freitas"]
    s.email       = 'dayan.freitas.df@gmail.com.br'
    s.files       = ["lib/rsa.rb"]
    s.licenses    = ['MIT']
    s.require_paths = ["lib"]
    s.homepage    = 'https://github.com/Dayanfreitas/RSA'

    s.files              = Dir.glob('lib/*.rb')
    s.bindir             = %q(bin)
    s.executables        = %w()
    s.default_executable = s.executables.first
    s.require_paths      = %w(lib)
end