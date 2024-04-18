const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{rb,erb}'
  ],
  theme: {
    extend: {
      /**
       * Colors picked from codepath.org
       */
      colors: {
        seafoam: {
          400: "#00C385"
        },
        space: {
          400: "#1b1c57"
        },
        "prussian-blue": {
          400: "#062f54"
        },
        "ultramarine-blue": {
          400: "#4f5eff"
        }
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
