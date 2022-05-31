//SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import './SVG.sol';
import './Utils.sol';

contract Renderer {
    function render(uint256 _tokenId) public pure returns (string memory) {
        return
            string.concat(
                '<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" style="background:#F6F6F6;font-family:Helvetica Neue;font-color:#000000">',
                svg.text(
                    string.concat(
                        svg.prop('x', '30'),
                        svg.prop('y', '60'),
                        svg.prop('font-size', '20')
                    ),
                    svg.cdata('LIQUID SPLIT')
                    
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '30'),
                        svg.prop('y', '120'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('HOLDER')
                    
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '140'),
                        svg.prop('y', '120'),
                        svg.prop('font-size', '16')
                    ),
                    svg.cdata('0X2cF3...3D6b')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '30'),
                        svg.prop('y', '140'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('VALUE')
                    
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '140'),
                        svg.prop('y', '140'),
                        svg.prop('font-size', '16')
                    ),
                    string.concat(
                        svg.cdata('$'),
                        svg.cdata('2.38')
                    )
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '30'),
                        svg.prop('y', '160'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('TOKEN_ID')
                    
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '140'),
                        svg.prop('y', '160'),
                        svg.prop('font-size', '16')
                    ),
                    utils.uint2str(_tokenId)
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '30'),
                        svg.prop('y', '220'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('CONTRACT')
                    
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '140'),
                        svg.prop('y', '220'),
                        svg.prop('font-size', '16')
                    ),
                    svg.cdata('0XA73C...1dac')
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '30'),
                        svg.prop('y', '240'),
                        svg.prop('font-size', '12')
                    ),
                    svg.cdata('BALANCE')
                    
                ),
                svg.text(
                    string.concat(
                        svg.prop('x', '140'),
                        svg.prop('y', '240'),
                        svg.prop('font-size', '16')
                    ),
                    string.concat(
                        svg.cdata('$'),
                        svg.cdata('2,381.48')
                    )
                ),
                '</svg>'
            );
    }

    function example() external pure returns (string memory) {
        return render(1);
    }
}
