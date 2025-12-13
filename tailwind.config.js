/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/views/**/*.{html,erb}",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.{js,jsx,ts,tsx}",π
  ],
  theme: {
    extend: {
      fontSize: {
        xxs: "0.6rem",
    },
  },
  plugins: [
    require("daisyui"),
  ],
};