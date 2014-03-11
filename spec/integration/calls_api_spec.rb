require 'spec_helper'
require 'pry'

describe HelloBlock::Client, '#addresses' do
  let(:client)  { HelloBlock::Client.new }
  let(:address) { '1DQN9nopGvSCDnM3LH1w7j36FtnQDZKnej' }

  it 'hits the api endpoint for addresses' do
    VCR.use_cassette(:addresses) do
      response = client.addresses(addresses: [address])

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Client, '#unspents' do
  let(:client)  { HelloBlock::Client.new }
  let(:address) { '1DQN9nopGvSCDnM3LH1w7j36FtnQDZKnej' }

  it 'hits the api endpoint for unspents' do
    VCR.use_cassette(:unspents) do
      response = client.unspents(addresses: [address])

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Client, '#transactions_for_address' do
  let(:client)  { HelloBlock::Client.new }
  let(:address) { '1DQN9nopGvSCDnM3LH1w7j36FtnQDZKnej' }

  it 'hits the api endpoint for address transactions' do
    VCR.use_cassette(:transactions_for_address) do
      response = client.transactions_for_address(addresses: [address])

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Client, '#transactions' do
  let(:client)  { HelloBlock::Client.new }
  let(:txHash) { '' }

  it 'hits the api endpoint for transactions' do
    VCR.use_cassette(:transactions) do
      response = client.transactions(txHashes: [txHash])

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Client, '#latest_transaction' do
  let(:client)  { HelloBlock::Client.new }

  it 'hits the api endpoint for latest transactions' do
    VCR.use_cassette(:latest_transaction) do
      response = client.latest_transaction

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Client, '#propagate' do
  let(:client)    { HelloBlock::Client.new }
  let(:rawTxHash) { '' }

  it 'hits the api endpoint for propagating' do
    VCR.use_cassette(:propagate) do
      response = client.propagate(raxTxHash: rawTxHash)

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Client, '#blocks' do
  let(:client)  { HelloBlock::Client.new }
  let(:blockId) { '' }

  it 'hits the api endpoint for blocks' do
    VCR.use_cassette(:blocks) do
      response = client.blocks(blockId: blockId)

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Client, '#latest_blocks' do
  let(:client)  { HelloBlock::Client.new }

  it 'hits the api endpoint for latest blocks' do
    VCR.use_cassette(:latest_blocks) do
      response = client.latest_blocks

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Client, '#wallet' do
  let(:client)  { HelloBlock::Client.new }
  let(:address) { '1DQN9nopGvSCDnM3LH1w7j36FtnQDZKnej' }

  it 'hits the api endpoint for wallets' do
    VCR.use_cassette(:wallet) do
      response = client.wallet(addresses: [address])

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Client, '#faucet' do
  let(:client) { HelloBlock::Client.new }
  let(:type)   { 3 }

  it 'hits the api endpoint for the faucet' do
    VCR.use_cassette(:faucet) do
      response = client.faucet(type: [type])

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Client, '#withdrawal' do
  let(:client)  { HelloBlock::Client.new }
  let(:amount)  { 100000 }
  let(:address) { '1DQN9nopGvSCDnM3LH1w7j36FtnQDZKnej' }

  it 'hits the api endpoint for withdrawal' do
    VCR.use_cassette(:withdrawal) do
      response = client.withdrawal(amount: amount, toAddress: address)

      expect(response['status']).to eq 'success'
    end
  end
end
