// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ERC20oken {
    string public constant name = "GilgitCity12";
    string public constant symbol = "GLT23";
    uint8 public constant decimals = 18;

    mapping(address => uint256) balances;  // Track each user's balance
    mapping(address => mapping(address => uint256)) allowed;  // Track allowances

    uint256 totalSupply_;  // Total supply of tokens

    event Transfer(address indexed from, address indexed to, uint256 tokens);  // Transfer event
    event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);  // Approval event
    event Burn(address indexed burner, uint256 tokens);  // Burn event

    // Constructor to initialize the total supply and assign to the owner
    constructor(uint256 total) {
        totalSupply_ = total;
        balances[msg.sender] = totalSupply_;  // Assign all tokens to contract deployer
    }

    // Function to return the total supply
    function totalSupply() external view returns (uint256) {
        return totalSupply_;
    }

    // Function to get balance of a token owner
    function balanceOf(address _tokenOwner) external view returns (uint256) {
        return balances[_tokenOwner];
    }

    // Internal function to burn tokens (reduce supply and balance)
    function _burn(address _tokenOwner, uint256 _numTokens) internal returns (bool) {
        require(_tokenOwner != address(0), "ERC20: burn from zero address");
        require(_numTokens <= balances[_tokenOwner], "Insufficient balance to burn");

        totalSupply_ -= _numTokens;  // Reduce total supply
        balances[_tokenOwner] -= _numTokens;  // Reduce owner's balance
        emit Transfer(_tokenOwner, address(0), _numTokens);  // Emit transfer to zero address (burn)
        emit Burn(_tokenOwner, _numTokens);  // Emit burn event

        return true;
    }

    // Public function to allow a user to burn their own tokens
    function burn(uint256 _numTokens) external returns (bool) {
        _burn(msg.sender, _numTokens);
        return true;
    }

    // Transfer function with 10% fee that is burned
    function transfer(address _receiver, uint256 _numTokens) external returns (bool) {
        require(_numTokens <= balances[msg.sender], "Insufficient balance");

        uint256 fee = (_numTokens * 10) / 100;  // Calculate 10% fee
        uint256 senderAmount = _numTokens - fee;  // Calculate amount after fee

        balances[msg.sender] -= _numTokens;  // Deduct total tokens from sender
        balances[_receiver] += senderAmount;  // Add net amount to receiver
        emit Transfer(msg.sender, _receiver, senderAmount);  // Emit transfer event
        _burn(msg.sender, fee);  // Burn the fee

        return true;
    }

    // Approve delegate to spend tokens on behalf of the owner
    function approve(address delegate, uint256 numTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numTokens;  // Set allowance
        emit Approval(msg.sender, delegate, numTokens);  // Emit approval event
        return true;
    }

    // Check how many tokens a delegate can spend
    function allowance(address owner, address delegate) public view returns (uint256) {
        return allowed[owner][delegate];  // Return remaining allowance
    }

    // Function to allow a delegate to transfer tokens on behalf of an owner
    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner], "Insufficient balance");  // Check owner's balance
        require(numTokens <= allowed[owner][msg.sender], "Allowance exceeded");  // Check delegate's allowance

        balances[owner] -= numTokens;  // Deduct tokens from owner
        allowed[owner][msg.sender] -= numTokens;  // Reduce delegate's allowance
        balances[buyer] += numTokens;  // Add tokens to buyer
        emit Transfer(owner, buyer, numTokens);  // Emit transfer event

        return true;
    }
}
