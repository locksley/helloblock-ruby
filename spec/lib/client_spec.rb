require 'spec_helper'

describe HelloBlock::Client, '#env' do
  it 'defaults to testnet' do
    client = HelloBlock::Client.new

    expect(client.network).to eq :testnet
  end
end
