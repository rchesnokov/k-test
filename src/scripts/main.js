import './common/polyfill'
import './app.js'

require.context('../', true, /\.(html)/)
require.context('../images/', true, /\.(jpg|png|svg)/)
require('reset-css/reset.css')
require('select2/dist/css/select2.min.css')
require('../styles/main.styl')