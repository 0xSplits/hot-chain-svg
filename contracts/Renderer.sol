//SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import './SVG.sol';
import './Utils.sol';

contract Renderer {
    function render(
        string memory contractAddress,
        string memory chainId,
        string memory mintedOnDate
    ) public pure returns (string memory) {
        return
            string.concat(
                '<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" style="background:#F6F5EA;font-family:monospace;fill:#343434">',
                svg.text(
                    string.concat(
                        svg.prop('x', '9'),
                        svg.prop('y', '18'),
                        svg.prop('font-size', '12'),
                        svg.prop('fill', '#387D47'),
                        svg.prop('letter-spacing', '-0.5')
                    ),
                    svg.cdata(contractAddress)
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '9'),
                        svg.prop('y', '290'),
                        svg.prop('font-size', '12'),
                        svg.prop('fill', '#387D47'),
                        svg.prop('letter-spacing', '-0.5')
                    ),
                    svg.cdata(contractAddress)
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '34'),
                        svg.prop('y', '66'),
                        svg.prop('font-weight', '700'),
                        svg.prop('font-size', '18')
                    ),
                    svg.cdata('0XSPLITS LIQUID SPLIT')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '36'),
                        svg.prop('y', '96'),
                        svg.prop('fill', '#777777'),
                        svg.prop('font-size', '13')
                    ),
                    svg.cdata('Each token entitles the owner')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '36'),
                        svg.prop('y', '112'),
                        svg.prop('fill', '#777777'),
                        svg.prop('font-size', '13')
                    ),
                    svg.cdata("to 0.1% of the Split's income")
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '72'),
                        svg.prop('y', '255'),
                        svg.prop('font-size', '18')
                    ),
                    svg.cdata('10 TOKENS = 1%')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '67'),
                        svg.prop('y', '170'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('CHAIN')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '60'),
                        svg.prop('y', '195'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('MINTED')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '140'),
                        svg.prop('y', '170'),
                        svg.prop('font-size', '18'),
                        svg.prop('fill', '#387D47')
                    ),
                    svg.cdata(chainId)
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '140'),
                        svg.prop('y', '195'),
                        svg.prop('font-size', '18'),
                        svg.prop('fill', '#387D47')
                    ),
                    svg.cdata(mintedOnDate)
                ),
                '</svg>'
            );
    }

    function example() external pure returns (string memory) {
        return
            render(
                '0x2ed6c4B5dA6378c7897AC67Ba9e43102Feb694EE',
                '1',
                '2022-10-07'
            );
    }
}
