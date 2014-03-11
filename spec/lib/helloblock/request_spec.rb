require 'spec_helper'

describe HelloBlock::Client::Request, '#get' do
  let(:client)     { HelloBlock::Client.new }
  let(:connection) { double(:connection).as_null_object }

  it 'makes a GET request to the provided path and with the provided params' do
    client.stub(:connection).and_return(connection)

    client.get('/addresses', addresses: ['abc', '123'])

    expect(connection).to have_received(:get).with(
      '/addresses', { addresses: 'abc&addresses=123' }, {
        accept: '*/*', content_type: 'application/json; charset=UTF-8'
      }
    )
  end
end

describe HelloBlock::Client::Request, '#post' do
  let(:client)     { HelloBlock::Client.new }
  let(:connection) { double(:connection).as_null_object }

  it 'makes a POST request to the provided path and with the provided body' do
    client.stub(:connection).and_return(connection)

    client.post('/addresses', addresses: ['abc', '123'])

    expect(connection).to have_received(:post).with(
      '/addresses', { body: { addresses: ['abc', '123'] } }, {
        accept: '*/*', content_type: 'application/json; charset=UTF-8'
      }
    )
  end
end
