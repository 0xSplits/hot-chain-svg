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
                '<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" style="background:#FAFAFA;font-family:monospace;font-color:#000000">',
                svg.text(
                    string.concat(
                        svg.prop('x', '10'),
                        svg.prop('y', '25'),
                        svg.prop('font-size', '11'),
                        svg.prop('fill', '#387D47')
                    ),
                    svg.cdata(contractAddress)
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '10'),
                        svg.prop('y', '280'),
                        svg.prop('font-size', '11'),
                        svg.prop('fill', '#387D47')
                    ),
                    svg.cdata(contractAddress)
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '36'),
                        svg.prop('y', '56'),
                        svg.prop('font-size', '18')
                    ),
                    svg.cdata('0XSPLITS LIQUID SPLIT')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '24'),
                        svg.prop('y', '90'),
                        svg.prop('font-size', '13')
                    ),
                    svg.cdata('Each token entitles the owner to')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '48'),
                        svg.prop('y', '108'),
                        svg.prop('font-size', '13')
                    ),
                    svg.cdata("0.1% of the Split's income")
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '68'),
                        svg.prop('y', '260'),
                        svg.prop('font-size', '20')
                    ),
                    svg.cdata('10 TOKENS = 1%')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '67'),
                        svg.prop('y', '150'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('CHAIN')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '60'),
                        svg.prop('y', '175'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('MINTED')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '60'),
                        svg.prop('y', '200'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('SERIES')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '140'),
                        svg.prop('y', '150'),
                        svg.prop('font-size', '18'),
                        svg.prop('fill', '#387D47')
                    ),
                    svg.cdata(chainId)
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '140'),
                        svg.prop('y', '175'),
                        svg.prop('font-size', '18'),
                        svg.prop('fill', '#387D47')
                    ),
                    svg.cdata(mintedOnDate)
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '140'),
                        svg.prop('y', '200'),
                        svg.prop('font-size', '18'),
                        svg.prop('fill', '#387D47')
                    ),
                    svg.cdata('01000001')
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
