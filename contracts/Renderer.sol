//SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import './SVG.sol';
import './Utils.sol';

contract Renderer {
    uint256 internal constant size = 600;
    uint256 internal constant rowSpacing = size / 9;
    uint256 internal constant colSpacing = size / 14;
    uint256 internal constant maxR = colSpacing * 65 / 100;
    uint256 internal constant minR = colSpacing * 3 / 10;
    uint256 internal constant maxDur = 60;
    uint256 internal constant minDur = 30;

    function randomR(uint256 seed) internal pure returns (uint256 r) {
        r = utils.bound(seed, maxR, minR);
    }

    function randomDur(uint256 seed) internal pure returns (uint256 dur) {
        dur = utils.bound(seed, maxDur, minDur);
    }

    function newSeed(uint256 seed) internal pure returns (uint256 newSeed) {
       newSeed = uint256(keccak256(abi.encodePacked(seed)));
    }

    function newSeed(uint256 seed, uint256 times) internal pure returns (uint256 newSeed) {
        newSeed = seed;
        for (uint i; i < times; i++) {
            newSeed = uint256(keccak256(abi.encodePacked(newSeed)));
        }
    }

    function render(
        address addr
    ) public pure returns (string memory) {
        uint256 seed = uint256(uint160(addr));
        string memory color = utils.getHslColor(seed);
        seed = newSeed(seed);

        uint256 rowHeight = rowSpacing * 5 / 2;
        string memory drawLogoRow5 = string.concat(
            utils.drawOrb(5 * colSpacing, rowHeight, randomR(newSeed(seed, 0)), randomDur(newSeed(seed, 1)), color),
            utils.drawOrb(7 * colSpacing, rowHeight, randomR(newSeed(seed, 2)), randomDur(newSeed(seed, 3)), color),
            utils.drawOrb(9 * colSpacing, rowHeight, randomR(newSeed(seed, 4)), randomDur(newSeed(seed, 5)), color)
        );
        seed = newSeed(seed, 6);

        rowHeight += rowSpacing;
        string memory drawLogoRow4 = string.concat(
            utils.drawOrb(4 * colSpacing, rowHeight, randomR(newSeed(seed, 0)), randomDur(newSeed(seed, 1)), color),
            utils.drawOrb(6 * colSpacing, rowHeight, randomR(newSeed(seed, 2)), randomDur(newSeed(seed, 3)), color),
            utils.drawOrb(8 * colSpacing, rowHeight, randomR(newSeed(seed, 4)), randomDur(newSeed(seed, 5)), color),
            utils.drawOrb(10 * colSpacing, rowHeight, randomR(newSeed(seed, 6)), randomDur(newSeed(seed, 7)), color)
        );
        seed = newSeed(seed, 8);

        rowHeight += rowSpacing;
        string memory drawLogoRow3 = string.concat(
            utils.drawOrb(3 * colSpacing, rowHeight, randomR(newSeed(seed, 0)), randomDur(newSeed(seed, 1)), color),
            utils.drawOrb(5 * colSpacing, rowHeight, randomR(newSeed(seed, 2)), randomDur(newSeed(seed, 3)), color),
            utils.drawOrb(7 * colSpacing, rowHeight, randomR(newSeed(seed, 4)), randomDur(newSeed(seed, 5)), color),
            utils.drawOrb(9 * colSpacing, rowHeight, randomR(newSeed(seed, 6)), randomDur(newSeed(seed, 7)), color),
            utils.drawOrb(11 * colSpacing, rowHeight, randomR(newSeed(seed, 8)), randomDur(newSeed(seed, 9)), color)
        );
        seed = newSeed(seed, 10);

        rowHeight += rowSpacing;
        string memory drawLogoRow2 = string.concat(
            utils.drawOrb(4 * colSpacing, rowHeight, randomR(newSeed(seed, 0)), randomDur(newSeed(seed, 1)), color),
            utils.drawOrb(6 * colSpacing, rowHeight, randomR(newSeed(seed, 2)), randomDur(newSeed(seed, 3)), color),
            utils.drawOrb(8 * colSpacing, rowHeight, randomR(newSeed(seed, 4)), randomDur(newSeed(seed, 5)), color),
            utils.drawOrb(10 * colSpacing, rowHeight, randomR(newSeed(seed, 6)), randomDur(newSeed(seed, 7)), color)
        );
        seed = newSeed(seed, 8);

        rowHeight += rowSpacing;
        string memory drawLogoRow1 = string.concat(
            utils.drawOrb(5 * colSpacing, rowHeight, randomR(newSeed(seed, 0)), randomDur(newSeed(seed, 1)), color),
            utils.drawOrb(7 * colSpacing, rowHeight, randomR(newSeed(seed, 2)), randomDur(newSeed(seed, 3)), color),
            utils.drawOrb(9 * colSpacing, rowHeight, randomR(newSeed(seed, 4)), randomDur(newSeed(seed, 5)), color)
        );
        seed = newSeed(seed, 6);

        string memory logo = string.concat(
            drawLogoRow5,
            drawLogoRow4,
            drawLogoRow3,
            drawLogoRow2,
            drawLogoRow1
        );

        return
            string.concat(
                '<svg xmlns="http://www.w3.org/2000/svg" width="',
                utils.uint2str(size),
                '" height="',
                utils.uint2str(size),
                '"style="background:#000000;font-family:sans-serif;fill:#fafafa;font-size:32">',
                logo,
                '</svg>'
            );
    }

    function example() external view returns (string memory) {
        return
            render(address(this));
    }
}
