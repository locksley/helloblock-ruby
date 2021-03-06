# HelloBlock

Ruby wrapper for the [HelloBlock.io](http://helloblock.io) API.

## Installation

Add this line to your application's Gemfile:

    gem 'helloblock-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install helloblock-ruby

## Usage

Initialize the HelloBlock client, and set the network to testnet or mainnet.

```rb
block = HelloBlock::Client.new
block.network = :mainnet # defaults to :testnet
```

Description  | Method
------------- | ------------- |
Batch get addresses  | `block.addresses(addresses: ['ADDRESS1', 'ADDRESS2'])`|
Batch get unspents  | `block.unspents(addresses: [...])` |
Batch get transactions from address | `block.transactions_for_address(addresses: [...])`
Batch get transactions | `block.transactions(txHashes: [...])` |
Get latest transactions | `block.latest_transaction` |
Post transaction propagation | `block.propagate(rawTxHash: '...')` |
Get block | `block.blocks(blockId: '...')` |
Get latest block | `block.latest_blocks` |
Get wallet info | `block.wallet(addresses: [...])` |
Get faucet coins | `block.faucet(type: 3)` |
Post coins withdrawal | `block.withdrawal(amount: 100000, toAddress: '...')` |

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
