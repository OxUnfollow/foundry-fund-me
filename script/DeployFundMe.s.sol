// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from 'forge-std/Script.sol';
import {FundMe} from '../src/FundMe.sol';
import {HelperConfig} from './HelperConfig.s.sol';

contract DeployFundMe is Script {
    address SEPOLICA_CONTRACT = 0x694AA1769357215DE4FAC081bf1f309aDC325306 ;

    function run() external returns(FundMe) {
        
        // Before startBroadcast _> Not a "real" tx
        HelperConfig helperConfig = new HelperConfig();

        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        // After startBroadcast -> Real tx
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();

        return fundMe;
    }
}