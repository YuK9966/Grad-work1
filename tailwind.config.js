/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/views/**/*.{html,erb}",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.{js,jsx,ts,tsx}",
  ],
  safelist: [
    'text-xxs',
  ],
  theme: {
    extend: {
      fontSize: {
        xxs: ['0.6rem', { lineHeight: '0.85rem' }],
      },
    },
  },
  plugins: [
    require("daisyui"),
  ],
};