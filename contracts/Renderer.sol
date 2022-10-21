//SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import './SVG.sol';
import './Utils.sol';

contract Renderer {
    uint256 internal constant size = 600;
    uint256 internal constant rowSpacing = size / 8;
    uint256 internal constant colSpacing = size / 14;
    uint256 internal constant maxR = colSpacing * 65 / 100;
    uint256 internal constant minR = colSpacing * 3 / 10;
    uint256 internal constant maxDur = 60;
    uint256 internal constant minDur = 30;

    function render(
        address addr
    ) public pure returns (string memory) {
        string memory logo;
        uint256 seed = uint256(uint160(addr));
        string memory color = utils.getHslColor(seed);
        uint8[5] memory xs = [5, 4, 3, 4, 5];
        uint256 y = rowSpacing * 2;
        for (uint256 i; i < 5; i++) {
            uint256 x = colSpacing * xs[i];
            for (uint256 j; j < (8 - xs[i]); j++) {
                logo = string.concat(
                    logo,
                    drawRandomOrb(x, y, color, seed = newSeed(seed))
                );
                x += colSpacing * 2;
            }
            y += rowSpacing;
        }

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

    function drawRandomOrb(
                     uint256 cx,
                     uint256 cy,
                     string memory color,
                     uint256 seed
                     ) internal pure returns (string memory) {
        uint256 r = randomR(seed);
        uint256 dur = randomDur(seed);
        return utils.drawOrb(cx, cy, r, dur, color);
    }

    function example() external view returns (string memory) {
        return
            render(address(this));
    }
}
