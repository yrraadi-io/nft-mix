from brownie import SimpleCollectible, accounts, network, config

def main():
    dev = accounts.add(config["wallets"]["from_key"])
    print(network.show_active())
    simple_collectible = SimpleCollectible[len(SimpleCollectible) - 1]
    token_id = input('Enter your tokenId')
    ownerName = input('Enter your name')
    simple_collectible.assignOwner(token_id, ownerName, {"from": dev})
    print(simple_collectible.returnOwnerName(token_id, {"from": dev}))