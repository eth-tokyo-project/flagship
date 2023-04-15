// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/*

  <g transform="translate(184 32)">
  <g transform="translate(200 32)">
  <g transform="translate(216 32)">
  */

import {LibString} from "solmate/utils/LibString.sol";

library SvgRender {
    function render(string memory title, uint256 winners, string memory challengeName, string memory smallDesc)
        internal
        pure
        returns (string memory)
    {
        return string.concat(
            '<svg xmlns="http://www.w3.org/2000/svg" width="264" height="412" class="transition-colors">',
            "<style>",
            "rect,text{transition:fill .15s cubic-bezier(.4,0,.2,1)}path{transition:stroke .15s cubic-bezier(.4,0,.2,1)}text{dominant-baseline:central}text.a,text.b{font-family:&quot;Roboto&quot;,sans-serif}text.a{fill:#323437;letter-spacing:-.05em}text.b{fill:#aaaeb3}text.c{font-size:16px}text.d{font-size:12px}",
            "</style>",
            // <rect width="264" height="412" fill="#ebb723" rx="8"/>
            rect(props("width", "264", "height", "412", "fill", "#ebb723", "rx", "8"), ""),
            // <rect width="256" height="404" x="4" y="4" fill="#e1e1e3" rx="4"/>
            rect(
                string.concat(
                    props("width", "256", "height", "404", "x", "4"), props("y", "4", "fill", "#e1e1e3", "rx", "4")
                ),
                ""
            ),
            // <text x="20" y="48" class="a" font-size="25">Ethernaut #1</text>
            text(props("x", "20", "y", "48", "class", "a", "font-size", "25"), title),
            // <rect width="64" height="24" x="176" y="28" fill="#323437" rx="12"/>
            rect(
                string.concat(
                    props("width", "64", "height", "24", "x", "176"), props("y", "28", "fill", "#323437", "rx", "12")
                ),
                ""
            ),
            // <path fill="#e1e1e1" d="M191 34h2l1 3 4 1v1l-2 3v3c1 1 0 2-1 1l-3-2-3 2c-1 1-2 0-1-1v-3l-2-3v-1l4-1 1-3zm16 0h2l1 3 4 1v1l-2 3v3c1 1 0 2-1 1l-3-2-3 2c-1 1-2 0-1-1v-3l-2-3v-1l4-1 1-3zm16 0h2l1 3 4 1v1l-2 3v3c1 1 0 2-1 1l-3-2-3 2c-1 1-2 0-1-1v-3l-2-3v-1l4-1 1-3z"/>
            path(
                props(
                    "fill",
                    "#e1e1e1",
                    "d",
                    "M191 34h2l1 3 4 1v1l-2 3v3c1 1 0 2-1 1l-3-2-3 2c-1 1-2 0-1-1v-3l-2-3v-1l4-1 1-3zm16 0h2l1 3 4 1v1l-2 3v3c1 1 0 2-1 1l-3-2-3 2c-1 1-2 0-1-1v-3l-2-3v-1l4-1 1-3zm16 0h2l1 3 4 1v1l-2 3v3c1 1 0 2-1 1l-3-2-3 2c-1 1-2 0-1-1v-3l-2-3v-1l4-1 1-3z"
                ),
                ""
            ),
            // <rect width="224" height="224" x="20" y="68" fill="rgba(0,0,0,0.2)" rx="8"/>
            rect(
                string.concat(
                    props("width", "224", "height", "224", "x", "20"),
                    props("y", "68", "fill", "rgba(0,0,0,0.2)", "rx", "8")
                ),
                ""
            ),
            // <path fill="none" stroke="#0b4c6c" stroke-linecap="round" stroke-linejoin="round" d="M34 318a5 5 0 0 0-4-1 5 5 0 0 0-4 1m8 0a6 6 0 1 0-8 0m8 0a6 6 0 0 1-4 2 6 6 0 0 1-4-2m6-5a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
            path(
                string.concat(
                    props("fill", "none", "stroke", "#0b4c6c", "stroke-linecap", "round"),
                    props(
                        "stroke-linejoin",
                        "round",
                        "d",
                        "M34 318a5 5 0 0 0-4-1 5 5 0 0 0-4 1m8 0a6 6 0 1 0-8 0m8 0a6 6 0 0 1-4 2 6 6 0 0 1-4-2m6-5a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"
                    )
                ),
                ""
            ),
            // <text x="44" y="314" class="a c" font-size="14">3</text>
            text(props("x", "44", "y", "314", "class", "a c", "font-size", "14"), LibString.toString(winners)),
            // <text x="44" y="334" class="b d" font-size="14">Times Captured</text>
            text(props("x", "44", "y", "334", "class", "b d", "font-size", "14"), "Times Captured"),
            // <path fill="none" stroke="#0b4c6c" stroke-linecap="round" stroke-linejoin="round" d="m143 311 2 2-2 1m3 0h2m-6 6h9a2 2 0 0 0 1-2v-8a2 2 0 0 0-1-1h-9a2 2 0 0 0-2 1v8a2 2 0 0 0 2 2z"/>
            path(
                string.concat(
                    props("fill", "none", "stroke", "#0b4c6c", "stroke-linecap", "round"),
                    props(
                        "stroke-linejoin",
                        "round",
                        "d",
                        "m143 311 2 2-2 1m3 0h2m-6 6h9a2 2 0 0 0 1-2v-8a2 2 0 0 0-1-1h-9a2 2 0 0 0-2 1v8a2 2 0 0 0 2 2z"
                    )
                ),
                ""
            ),
            // <text x="160" y="314" class="a c" font-size="14">Fallback</text>
            text(props("x", "160", "y", "314", "class", "a c", "font-size", "14"), challengeName),
            // <text x="160" y="334" class="b d" font-size="14">Name</text>
            text(props("x", "160", "y", "334", "class", "b d", "font-size", "14"), "Name"),
            // <text x="44" y="364" class="a c" font-size="14">Drain the contract to win </text>
            text(props("x", "44", "y", "364", "class", "a c", "font-size", "14"), smallDesc),
            // <text x="44" y="384" class="b d" font-size="14">Description</text>
            text(props("x", "44", "y", "384", "class", "b d", "font-size", "14"), "Description"),
            // <path fill="#394240" d="M215 102h-36c0-7-5-12-12-12H95c-7 0-12 5-12 12H47c-7 0-12 5-12 12v24c0 27 21 48 48 48h2c4 17 17 30 34 34v38H95c-7 0-12 5-12 12v12h96v-12c0-7-5-12-12-12h-24v-38c17-4 30-17 34-34h2c27 0 48-21 48-48v-24c0-7-5-12-12-12zM83 162c-13 0-24-11-24-24v-12h24v36zm72 12a24 24 0 0 1-48 0v-60h48v60zm48-36c0 13-11 24-24 24v-36h24v12z"/>
            path(
                props(
                    "fill",
                    "#394240",
                    "d",
                    "M215 102h-36c0-7-5-12-12-12H95c-7 0-12 5-12 12H47c-7 0-12 5-12 12v24c0 27 21 48 48 48h2c4 17 17 30 34 34v38H95c-7 0-12 5-12 12v12h96v-12c0-7-5-12-12-12h-24v-38c17-4 30-17 34-34h2c27 0 48-21 48-48v-24c0-7-5-12-12-12zM83 162c-13 0-24-11-24-24v-12h24v36zm72 12a24 24 0 0 1-48 0v-60h48v60zm48-36c0 13-11 24-24 24v-36h24v12z"
                ),
                ""
            ),
            // <path fill="#F9EBB2" d="M155 174a24 24 0 0 1-48 0v-60h48v60z"/>
            path(props("fill", "#F9EBB2", "d", "M155 174a24 24 0 0 1-48 0v-60h48v60z"), ""),
            "</svg>"
        );
    }

    // Core SVG utilitiy library which helps us construct
    // onchain SVG's with a simple, web-like API.

    /* MAIN ELEMENTS */
    function g(string memory _props, string memory _children) internal pure returns (string memory) {
        return el("g", _props, _children);
    }

    function path(string memory _props, string memory _children) internal pure returns (string memory) {
        return el("path", _props, _children);
    }

    function text(string memory _props, string memory _children) internal pure returns (string memory) {
        return el("text", _props, _children);
    }

    function line(string memory _props, string memory _children) internal pure returns (string memory) {
        return el("line", _props, _children);
    }

    function circle(string memory _props, string memory _children) internal pure returns (string memory) {
        return el("circle", _props, _children);
    }

    function rect(string memory _props, string memory _children) internal pure returns (string memory) {
        return el("rect", _props, _children);
    }

    function filter(string memory _props, string memory _children) internal pure returns (string memory) {
        return el("filter", _props, _children);
    }

    /* GRADIENTS */
    function radialGradient(string memory _props, string memory _children) internal pure returns (string memory) {
        return el("radialGradient", _props, _children);
    }

    function linearGradient(string memory _props, string memory _children) internal pure returns (string memory) {
        return el("linearGradient", _props, _children);
    }

    function gradientStop(uint256 offset, string memory stopColor, string memory _props)
        internal
        pure
        returns (string memory)
    {
        return el(
            "stop",
            string.concat(
                prop("stop-color", stopColor),
                " ",
                prop("offset", string.concat(LibString.toString(offset), "%")),
                " ",
                _props
            ),
            ""
        );
    }

    function animateTransform(string memory _props) internal pure returns (string memory) {
        return el("animateTransform", _props, "");
    }

    /* COMMON */
    // A generic element, can be used to construct any SVG (or HTML) element
    function el(string memory _tag, string memory _props, string memory _children)
        internal
        pure
        returns (string memory)
    {
        return string.concat("<", _tag, " ", _props, ">", _children, "</", _tag, ">");
    }

    // an SVG attribute
    function prop(string memory _key, string memory _val) internal pure returns (string memory) {
        return string.concat(_key, "=", '"', _val, '" ');
    }

    function props(string memory _k1, string memory _v1, string memory _k2, string memory _v2)
        internal
        pure
        returns (string memory)
    {
        return string.concat(prop(_k1, _v1), prop(_k2, _v2));
    }

    function props(
        string memory _k1,
        string memory _v1,
        string memory _k2,
        string memory _v2,
        string memory _k3,
        string memory _v3
    ) internal pure returns (string memory) {
        return string.concat(prop(_k1, _v1), prop(_k2, _v2), prop(_k3, _v3));
    }

    function props(
        string memory _k1,
        string memory _v1,
        string memory _k2,
        string memory _v2,
        string memory _k3,
        string memory _v3,
        string memory _k4,
        string memory _v4
    ) internal pure returns (string memory) {
        return string.concat(prop(_k1, _v1), prop(_k2, _v2), prop(_k3, _v3), prop(_k4, _v4));
    }
}
