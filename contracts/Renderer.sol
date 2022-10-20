//SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import './SVG.sol';
import './Utils.sol';

contract Renderer {
    function render(
        address addr,
        string memory contractAddress,
        string memory chainId,
        string memory mintedOnDate
    ) public pure returns (string memory) {
        // string memory contractAddress = utils.uint2str(uint256(uint160(addr)));
        string memory color = utils.getHslColor(uint256(uint160(addr)));
        string memory drawLogoRow5 = string.concat(
            utils.drawOrb(6, 5, 3, color),
            utils.drawOrb(4, 5, 2, color),
            utils.drawOrb(2, 5, 1, color)
        );
        string memory drawLogoRow4 = string.concat(
            utils.drawOrb(7, 4, 4, color),
            utils.drawOrb(5, 4, 3, color),
            utils.drawOrb(3, 4, 2, color),
            utils.drawOrb(1, 4, 1, color)
        );
        string memory drawLogoRow3 = string.concat(
            utils.drawOrb(8, 3, 5, color),
            utils.drawOrb(6, 3, 4, color),
            utils.drawOrb(4, 3, 3, color),
            utils.drawOrb(2, 3, 2, color),
            utils.drawOrb(0, 3, 1, color)
        );
        string memory drawLogoRow2 = string.concat(
            utils.drawOrb(7, 2, 4, color),
            utils.drawOrb(5, 2, 3, color),
            utils.drawOrb(3, 2, 2, color),
            utils.drawOrb(1, 2, 1, color)
        );
        string memory drawLogoRow1 = string.concat(
            utils.drawOrb(6, 1, 3, color),
            utils.drawOrb(4, 1, 2, color),
            utils.drawOrb(2, 1, 1, color)
        );
        string memory logo = string.concat(
            drawLogoRow5,
            drawLogoRow4,
            drawLogoRow3,
            drawLogoRow2,
            drawLogoRow1
        );
        string memory header = string.concat(
            svg.text(
                string.concat(svg.prop('x', '48'), svg.prop('y', '70')),
                svg.cdata('Liquid Split')
            ),
            svg.text(
                string.concat(svg.prop('x', '48'), svg.prop('y', '115')),
                string.concat(svg.cdata('Chain '), svg.cdata(chainId))
            ),
            svg.text(
                string.concat(svg.prop('x', '48'), svg.prop('y', '160')),
                string.concat(svg.cdata('Minted '), svg.cdata(mintedOnDate))
            )
        );
        string memory footer = string.concat(
            svg.text(
                string.concat(
                    svg.prop('x', '48'),
                    svg.prop('y', '520'),
                    svg.prop('font-size', '21'),
                    svg.prop('fill', color)
                ),
                svg.cdata(contractAddress)
            ),
            svg.text(
                string.concat(
                    svg.prop('x', '48'),
                    svg.prop('y', '550'),
                    svg.prop('fill', '#888888'),
                    svg.prop('font-size', '21')
                ),
                svg.cdata('Each token entitles the owner to 0.1% of the Split')
            )
        );
        return
            string.concat(
                '<svg xmlns="http://www.w3.org/2000/svg" width="600" height="600" style="background:#000000;font-family:sans-serif;fill:#fafafa;font-size:32">',
                logo,
                '</svg>'
            );
    }

    function example() external view returns (string memory) {
        return
            render(
                address(this),
                '0x2ed6c4B5dA6378c7897AC67Ba9e43102Feb694EE',
                '1',
                '2022-10-07'
            );
    }
}
