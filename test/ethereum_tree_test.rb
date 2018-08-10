require "test_helper"

class EthereumTreeTest < Minitest::Test

  #
  # - Create a xprv using Bitcoin Command Line Tool:
  #   $ bx seed | bx hd-new # https://github.com/libbitcoin/libbitcoin-explorer
  # - Then using https://iancoleman.io/bip39/ to Derived Addresses to calculate address, publickey, privatekey
  # - Using that results to build data test
  #
  def test_create_wallet_from_xprv
    xprv        = 'xprv9s21ZrQH143K3xgnwszedmWFvYzFNeZE8rbLBeJXGUhR4YjjaiBJ8UACTSf2Vopp46kpE2xWyfA5Lp3Y9GS4FJxNJhimwkAxQjqyaU6t156'
    master_node = EthereumTree::Node.from_bip32(xprv)

    node1       = master_node.node_for_path('m/0/0')
    address1    = node1.to_address
    prv_key1    = node1.private_key

    node2       = master_node.node_for_path('m/0/5')
    address2    = node2.to_address
    prv_key2    = node2.private_key

    node3       = master_node.node_for_path('m/0/19')
    address3    = node3.to_address
    prv_key3    = node3.private_key

    assert_equal address1, '0x524e9ff149eff200dd083a486d8f6b95feb6898d'
    assert_equal prv_key1, '3df0cbebb05a64ec5d69967314037dc8fd0711a0102a2776a3ec01e19d185dda'

    assert_equal address2, '0x24feb4fb0a7bbd049e9d0ec025e5e6083b4d1a02'
    assert_equal prv_key2, '2245a2dae8f38277ae287dce70f44241a20ee018e38e1c9d40edf7008b1af180'

    assert_equal address3, '0x80d2b21985212eadfdd8553c271cb9cdd3cd5366'
    assert_equal prv_key3, '3248f56382be7d3829f2fe374111645d9b8734aa95c6be62444d6515d211cd62'
  end
end
