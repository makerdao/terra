# Terra

Bot and tools to interact with Maker price feeds

## Installation

Clone repo `git clone https://github.com/makerdao/terra.git`

`cd terra`

`npm install` for additional packages

`make link` or `sudo make link` to link files locally

## Dependencies

Requires `seth`, `setzer` and `ethsign`.

Using the `nix` package manager (v2.0 or above):

`curl https://nixos.org/nix/install | sh`

`nix-channel --add https://nix.dapphub.com/pkgs/dapphub`

`nix-channel --update`

`nix-env -iA dapphub.{seth,ethsign,jshon}`

To install `setzer`:

`git clone https://github.com/makerdao/setzer`

`cd setzer`

`make link` or `sudo make link`

## Preparing terra

`terra` grabs ETH and MKR prices from different sources, then signs them with your private key and sends them to the cloud.

For this, you will need an encrypted wallet file (usually a `.json` file). If you use `geth` or `parity` you can copy your wallet file from `~/.ethereum/keystore` or `~/.local/share/io.parity.ethereum/keys/ethereum`

Or create a new wallet file using MyEtherWallet, or `geth account new` or `parity account new`.

Make a note of where you have this file. You will need the directory path.

Your file should be encrypted with a password. Create an empty file and write your password in it. You can do this by typing `touch myPassword` then opening the file with a text editing program and typing the password in it. Also make a note of the password file's location.

## Running the bot

Say you have your wallet file in `/home/user/wallet.json` and your password is in `/home/user/password.txt`.

You will run `terra` with:

`terra bot --from [account] --keystore /home/user/ --password /home/user/password.txt` to start bot

Notice you put the directory for `keystore` but the file for `password`.

If everything worked, you will receive an API key and begin pushing prices!