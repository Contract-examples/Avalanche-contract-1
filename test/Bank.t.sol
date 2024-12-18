// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "src/Bank.sol";

contract BankTest is Test {
    Bank public bank;

    function setUp() public {
        bank = new Bank(address(this));

        // get code size
        uint256 codeSize;
        address bankAddr = address(bank);
        assembly {
            codeSize := extcodesize(bankAddr)
        }
        console2.log("[before]: codeSize", codeSize);
    }

    // receive function to receive ETH
    receive() external payable { }

    function testDeposit() public {
        address user = makeAddr("user");
        vm.deal(user, 1 ether);
        vm.prank(user);
        bank.deposit{ value: 0.5 ether }();
        assertEq(bank.balances(user), 0.5 ether);
    }

    function testWithdraw() public {
        address bankAdmin = bank.admin();
        console2.log("Bank admin address:", bankAdmin);
        console2.log("Test contract address:", address(this));
        
        // Set initial balance for admin
        vm.deal(bankAdmin, 1 ether);
        uint256 initialBalance = bankAdmin.balance;
        console2.log("Initial admin balance:", initialBalance);
        
        // Transfer 2 ether to bank contract
        vm.deal(address(bank), 2 ether);
        console2.log("Bank contract balance:", address(bank).balance);
        
        // Execute withdrawal
        vm.startPrank(bankAdmin);
        bank.withdraw(1 ether);
        vm.stopPrank();
        
        uint256 finalBalance = bankAdmin.balance;
        console2.log("Final admin balance:", finalBalance);
        console2.log("Expected balance:", initialBalance + 1 ether);
        
        // Verify final balance
        assertEq(finalBalance, initialBalance + 1 ether);
    }

    function testDestroy() public {
        // Ensure contract has some ETH for testing
        vm.deal(address(bank), 1 ether);

        // Create a recipient address
        address payable recipient = payable(makeAddr("recipient"));
        uint256 initialBalance = recipient.balance;

        // Record contract's initial balance
        uint256 bankBalance = address(bank).balance;

        // Call destroy function
        bank.destroy(recipient);

        // Verify:
        // 1. Recipient should receive all ETH
        assertEq(recipient.balance, initialBalance + bankBalance);
    }
}
