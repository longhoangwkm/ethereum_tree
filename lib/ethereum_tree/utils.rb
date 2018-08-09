module EthereumTree
  module Utils
    def self.prefix_hex(hex)
      hex.match(/\A0x/) ? hex : "0x#{hex}"
    end

    def self.padding64(str)
      if str =~ /^0x[a-f0-9]*/
        str = str[2 .. str.length-1]
      end
      str.rjust(64, '0')
    end
  end
end
