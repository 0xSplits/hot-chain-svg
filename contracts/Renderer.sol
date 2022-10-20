//SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import './SVG.sol';
import './Utils.sol';

contract Renderer {
    function render(
        address addr
    ) public pure returns (string memory) {
        uint256 seed = uint256(uint160(addr));
        string memory color = utils.getHslColor(seed);

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

        return
            string.concat(
                '<svg xmlns="http://www.w3.org/2000/svg" width="600" height="600" style="background:#000000;font-family:sans-serif;fill:#fafafa;font-size:32">',
                logo,
                '</svg>'
            );
    }

    function example() external view returns (string memory) {
        return
            render(address(this));
    }
}
