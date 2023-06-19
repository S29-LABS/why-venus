// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./interfaces/IERC20.sol";


contract POLYPool {
    /// @dev there are 3 types of pools in this protocol, buyPool, sellPool and tradePool
    ///      for emphasis tradePool = buyPool & sellPool
    struct PoolType {
        uint8 buyPool;
        uint8 sellPool;
    }

    PoolType public poolType;
    address public factory;
    address public tokenA; // deposit token for buy pool
    address public tokenB; // deposit token for sell pool
    address public nft;

    


    bool isSinglePool = poolType.buyPool & poolType.sellPool == 0;

    bool isBuyPool    = poolType.buyPool == 1;



    
    /// @dev TRANSFER_SELECTOR is used for low level calls to the erc20 contract at an address
    ///      params address to (recipient), uint amount / value
    bytes4 private constant TRANSFER_SELECTOR     = bytes4(keccak256(bytes('transfer(address,uint256)')));

    // function transferFrom(address from, address to, uint value) external returns (bool);
    /// @dev TRANSFERFROM_SELECTOR is used for low level calls to the erc20 contract at an address
    ///      params address from(sender), address to(recipient), uint value / amount 
    bytes4 private constant TRANSFERFROM_SELECTOR = bytes4(keccak256(bytes('transferFrom(address,address,uint256)')));


    bytes4 private constant BALANCEOF_SELECTOR    = bytes4(keccak256(bytes('balanceOf(address)')));
 
    



 

    constructor() {
        factory = msg.sender;
    }

    modifier checkPoolType(address _tokenIn) {
        // can't swap with the deposit token in buy pool
        if ( isSinglePool && isBuyPool &&    tokenA == _tokenIn  ) revert("same token swap");

        // can't swap with the deposit token in sell pool
        if ( isSinglePool && !isBuyPool && !(tokenA == _tokenIn) ) revert("same token swap");
        _;
    }

    // initializes the pool type, we have two pool categories tokens and nfts, and 3 pool types
    function initialize(PoolType calldata _poolType) external pure {
        // check pool type
        require(_poolType.buyPool <= 1 || _poolType.sellPool <= 1, "Err: invalid Pool_Type.");
        // set pool type

    }

    function balanceOf(address _tokenIn) public view returns (uint256) {
        (bool success, bytes memory data) =
                _tokenIn.staticcall(abi.encodeWithSelector(BALANCEOF_SELECTOR, address(this)));

         require(success && data.length >= 32);

         return abi.decode(data, (uint256));
    }


    // a)
    // buyPool || sellPool || both
    // a user deposit 
    function swapTokenForToken(address _tokenIn, uint256 _amountIn) external returns (bool)  {
        require(_amountIn == 0, "Err: zero swap, not allowed");

        require(_tokenIn == address(0), "Err: zero address, not allowed");

        require(_tokenIn == tokenA || _tokenIn == tokenB, "Err: invalid token");

        address tokenIn;
        address tokenOut;

        if ( isSinglePool ) {

           (tokenIn, tokenOut) = isBuyPool ? (tokenA, tokenB) : (tokenB, tokenA);

        } else {

            // trade pool anything goes
           (tokenIn, tokenOut) = isBuyPool ? (tokenA, tokenB) : (tokenB, tokenA);

        }

        uint256 balanceBefore = balanceOf(tokenIn);

        // collect users token
        (bool success1, bytes memory data1) =
                    tokenIn.call(abi.encodeWithSelector(TRANSFERFROM_SELECTOR, msg.sender, address(this), _amountIn));

        require( success1  &&  data1.length  >=  32, "Err: TransferFrom Failed" );

        // balance of tokenIn held by this contract
        uint256 balanceAfter = balanceOf(tokenIn);

        // balance of tokenIn held by this contract after
        require( balanceBefore  +  _amountIn  >=  balanceAfter, "Err: balance not Increased" );

        uint256 amountOut = _amountIn; // To-do bonding curve pool logic

        // give user tokens
        (bool success2, bytes memory data2) = tokenOut.call(abi.encodeWithSelector(TRANSFER_SELECTOR, msg.sender, amountOut));

        require( success2  &&  data2.length  >=  32, "Err: Transfer Failed" );

        return true;
    }

    // b)
    // sellPool (NFT)
    function swapNFTForToken() external {

    }

    // c)
    // buyPool (NFT)
    function swapTokenForNFT() external {

    }

    // d) combine b) and c), for both.
}