require 'spec_helper'

describe HelloBlock::Client::Endpoints, '#base_url' do
  let(:client) { HelloBlock::Client.new }

  it 'returns a path to the api url given the network subdomain' do
    client.network = :testnet

    expect(client.base_url).to eq 'http://testnet.helloblock.io'
  end
end

describe HelloBlock::Client::Endpoints, '#post_request?' do
  let(:client) { HelloBlock::Client.new }
  before :each do
    stub_const('HelloBlock::Client::Endpoints::POST_REQUESTS', [:propagate])
  end

  it 'is true if the method called is a post request' do
    expect(client.post_request?(:propagate)).to eq true
  end

  it 'is false otherwise' do
    expect(client.post_request?(:bitcoin)).to eq false
  end
end

describe HelloBlock::Client::Endpoints, '#endpoint_defined?' do
  let(:client)  { HelloBlock::Client.new }
  before :each do
    stub_const('HelloBlock::Client::Endpoints::ADDRESSES_PATH', '/addresses')
  end

  it 'is true if the endpoint suffixed with "_PATH" maps to a path' do
    expect(client.endpoint_defined?(:addresses)).to eq true
  end

  it 'is false otherwise' do
    expect(client.endpoint_defined?(:bitcoin)).to eq false
  end
end

describe HelloBlock::Client::Endpoints, '#navigate_to_path' do
  let(:client) { HelloBlock::Client.new }
  before :each do
    stub_const('HelloBlock::Client::Endpoints::ADDRESSES_PATH', '/addresses')
  end

  it 'routes a GET method to a GET route' do
    client.stub(:get)

    client.navigate_to_path(:addresses, addresses: ['abc', '123'])

    expect(client).to have_received(:get).with(
      '/addresses', addresses: ['abc', '123']
    )
  end

  it 'routes a POST method to a POST route' do
    stub_const('HelloBlock::Client::Endpoints::POST_REQUESTS', [:addresses])
    client.stub(:post)

    client.navigate_to_path(:addresses, addresses: ['abc', '123'])

    expect(client).to have_received(:post).with(
      '/addresses', body: { addresses: ['abc', '123'] }
    )
  end
end

describe HelloBlock::Client::Endpoints, '#method_missing' do
  let(:client) { HelloBlock::Client.new }

  it 'navigates to an endpoint if the method resembles an endpoint' do
    stub_const('HelloBlock::Client::Endpoints::BANANAS_PATH', '/bananas')
    client.stub(:navigate_to_path)

    client.bananas(variety: 'chaquita')

    expect(client).to have_received(:navigate_to_path).with(
      :bananas, variety: 'chaquita'
    )
  end
end
