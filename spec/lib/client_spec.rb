require 'spec_helper'

describe HelloBlock::Client, '#env' do
  it 'defaults to testnet' do
    client = HelloBlock::Client.new

    expect(client.network).to eq :testnet
  end
end




#
# attr_writer :env
#
# include Connection
# include Request
# include Endpoints
# include Addresses
#
# def initialize
#
# end
#
# def network
#   @env ||= :testnet # :mainnet
# end
#
# def target_url
#   "http://#{network}.helloblock.io"
# end
