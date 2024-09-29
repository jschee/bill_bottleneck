/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./app/views/**/*.rb",
    "./app/views/**/*.html.erb",
    "./app/views/layouts/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/frontend/**/*.js",
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}