// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7 ;

interface IERC20{
    function transferFrom(address from,address to,uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
}

contract Airdrop {
    constructor() {}

    function BulkAirdropERC20(IERC20 _token, address[] calldata _to, calldata uint256[] _value) public {
        require(_to.length == _value.length, "number f addresses and values arent same ");
        for(uint256 i=0,i<=_to.length, i++){
            require(_token.transferFrom(msg.sender, _to[i], _value[i]));
        }
    }

    function BulkAirdropERC721(IERC721 _token, address[] calldata _to, calldata uint256[] _id) public {
        require(_to.length == _id.length, "number f addresses and values arent same ");
        for(uint256 i=0,i<=_to.length, i++){
            _token.transferFrom(msg.sender, _to[i], _id[i]);
        }
    }

    function BulkAirdropERC1155(IERC1155 _token, address[] calldata _to, uint256[] calldata _id, uint256[] calldata _amount) public {
        require(_to.length == _id.length, "number f addresses and values arent same ");
        for(uint256 i=0,i<=_to.length, i++){
            _token.transferFrom(msg.sender, _to[i], _id[i],_amount[i], "");
        }
    }
}
