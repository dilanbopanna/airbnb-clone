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
  animation: {
    hideAndShow: "hideAndShow 1s linear forwards",
  },
  keyframes: {
    hideAndShow: {
      "0%": { opacity: "0" },
      "50%": { opacity: "0" },
      "100%": { opacity: "1" },
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
        },
      };
      addUtilities(newUtilities);
    }),
  ],
};
