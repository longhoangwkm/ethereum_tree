# EthereumTree

A ruby library to generate ETH addresses from a Hierarchical Deterministic wallet according to the BIP32 standard.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ethereum_tree'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ethereum_tree

## Usage

```ruby
  master_node = EthereumTree::Node.from_bip32('tprv8ZgxMBicQKsPd66VHk9cQagZEkrgFgNzR3jcjKpCBLW87wWnz9dNxHnx41tUZoKygnoBsr4LJNof4TJxdiRpn6bH11B1vDxKJDFr31NL49d')
  child_node  = master_node.node_for_path("m/0/0'/1")
  prv_key     = child_node.private_key # f627053ef9ff983c1eccedb58912a2d3fc9fbfaccc52e4ebe15f96b90bf2cb09
  addr        = child_node.to_address  # 0xe971e29e925d00c38396a12774f4bc3c46978076
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ethereum_tree. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EthereumTree project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ethereum_tree/blob/master/CODE_OF_CONDUCT.md).
