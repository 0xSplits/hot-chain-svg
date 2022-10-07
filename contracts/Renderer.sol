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
                svg.rect(
                    string.concat(
                        svg.prop('x', '232'),
                        svg.prop('y', '20'),
                        svg.prop('width', utils.uint2str(48)),
                        svg.prop('height', utils.uint2str(48)),
                        svg.prop('fill', '#000000')
                    ),
                    utils.NULL
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '20'),
                        svg.prop('y', '40'),
                        svg.prop('font-size', '22'),
                        svg.prop('font-weight', '700')
                    ),
                    svg.cdata('LIQUID')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '20'),
                        svg.prop('y', '64'),
                        svg.prop('font-size', '22'),
                        svg.prop('font-weight', '700')
                    ),
                    svg.cdata('SPLIT')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '50'),
                        svg.prop('y', '130'),
                        svg.prop('font-size', '24')
                    ),
                    svg.cdata('10 TOKENS = 1%')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '34'),
                        svg.prop('y', '160'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('Each token entitles the owner to')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '54'),
                        svg.prop('y', '175'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata("0.01% of the Split's income")
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '21'),
                        svg.prop('y', '240'),
                        svg.prop('font-size', '10'),
                        svg.prop('fill', '#999999')
                    ),
                    svg.cdata(contractAddress)
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '20'),
                        svg.prop('y', '260'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('CHAIN_ID')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '20'),
                        svg.prop('y', '280'),
                        svg.prop('font-size', '16')
                    ),
                    svg.cdata(chainId)
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '210'),
                        svg.prop('y', '260'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('MINTED_ON')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '180'),
                        svg.prop('y', '280'),
                        svg.prop('font-size', '16')
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
