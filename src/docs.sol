// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/**
* Understanding poly-Swap: A primitive Token and NFT Amm
* 
* This is an automated market maker (AMM) protocol that facilitates both ERC20-to-ERC20 swaps and NFT-to-ERC20 swaps
* (and vice versa), leveraging the use of a bonding curve. ERC721 NFTs, ETH and all ERC20 tokens are supported. 
* 
* Pools
* There are three types of pools:
* i.   single-sided buy pools
* ii.  single-sided sell pools
* iii. dual-sided trade pools
*
* Usage 
* Liquidity Providers deposit ERC20 or ERC721 or ETH in a pool, they then choose the following:
* i.   sell the deposited assets
* ii.  used the deposited asset to purchase other specified asset
* iii. do both
* iv.  specify a starting and bonding price parameter
* 
* Users can then do the following:
* i.   buy the deposited assets
* ii.  sell their asset to obtain deposited assets
* 
* 
* Every time an asset is bought or sold, the price to buy or sell another item for the pool changes.
* 
* At any time liquidity provider can change the price of their pools / withdraw deposited assets.
* 
* 
* 
* Bonding Curve 
* A mathematical formula which defines the relationship between an asset's price and its supply.
* 
* Intuition behind bonding curves
* An Lp specifies to parameters:
* i.  start price
* ii. delta
*
* Linear Curve
* a) we have a token, 
*    example
*    A user with a token supply of 5_000_000_000 has a starting price of 1 eth, i.e 1 eth == 1 token
*    another user has the need to purchase 2000 tokens i.e. 2000 eth, the new price of the token increases
*    by the specified delta in this case the delta is 0.1 ETH. So the next user would be purchase the tokens 
*    would be 1.1 eth
* b) we have an nft
*    Similar thing happens with a user with an Nft collection of 75 has a starting price of 1 eth, recall
*    there are no distinction with ERC721 Id of choice.
*    another user has a need for one or multiple nfts in a collection at 1 each, the new price of the token
*    after this user has purchased would change and it would now be 1 eth + || - 0.1 eth
*
*
* Constant Price
* Prices here are constant, and do not increase or decrease. But can be changed specifically by the LP
* 
* Exponential Curve
* Here delta is represented in %percent, i.e. the price of an asset increases by this percent when bought 
* And also decreases by this percent when sold
*/



