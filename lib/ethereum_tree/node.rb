module EthereumTree
  class Node

    def initialize(wallet_node)
      @wallet_node = wallet_node
    end

    def self.from_bip32(address)
      wallet_node = MoneyTree::Master.from_bip32(address)
      Node.new(wallet_node)
    end

    def to_address
      # From bitcoin public key to ethereum public key
      group = ECDSA::Group::Secp256k1
      public_key = ECDSA::Format::PointOctetString.decode(@wallet_node.public_key.to_bytes, group)
      ethereum_public = EthereumTree::Utils.padding64(public_key.x.to_s(16)) +
        EthereumTree::Utils.padding64(public_key.y.to_s(16))

      # From ethereum public key to ethereum address
      bytes = RLP::Utils.decode_hex(ethereum_public)
      address_bytes = Digest::SHA3.new(256).digest(bytes)[-20..-1]
      address = RLP::Utils.encode_hex(address_bytes)
      EthereumTree::Utils.prefix_hex(address)
    end

    def private_key
      @wallet_node.private_key.key
    end

    def node_for_path(path)
      Node.new(@wallet_node.node_for_path(path))
    end
  end
end
