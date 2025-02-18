
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ethereum_tree/version'

Gem::Specification.new do |spec|
  spec.name          = 'ethereum_tree'
  spec.version       = EthereumTree::VERSION
  spec.authors       = ['longhoang.wkm']
  spec.email         = ['longhoang@wakumo.vn']

  spec.summary       = 'BIP32 Hierarchical Deterministic Ethereum wallet'
  spec.description   = 'A ruby library to generate ETH addresses from a Hierarchical Deterministic wallet according to the BIP32 standard.'
  spec.homepage      = 'https://github.com/longhoangwkm/ethereum_tree'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'minitest', '~> 5.14'
  spec.add_development_dependency 'pry-rails', '~> 0.3'

  spec.add_dependency 'ecdsa', '~> 1.2'
  spec.add_dependency 'keccak', '~> 1.3'
  spec.add_dependency 'rlp', '~> 0.7'
  spec.add_dependency 'money-tree', '~> 0.11.2'
end
