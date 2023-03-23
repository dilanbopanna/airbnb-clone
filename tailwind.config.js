const plugin = require("tailwindcss/plugin");
module.exports = {
    darkMode: "class",
    content: ["./src/**/*.js"],
    theme: {
        extend: {},
        fontFamily: {
            "fig-tree": '"FigTree"',
        },
    },
    plugins: [
        plugin(function ({ addUtilities }) {
            const newUtilities = {
                "*::-webkit-scrollbar": {
                    display: "none", // chrome and other
                },
                "*": {
                    scrollbarWidth: "none", // firefox
                },
                "*": {
                    "-webkit-tap-highlight-color": "transparent",
                }
            };
            addUtilities(newUtilities);
        }),
    ],
}
