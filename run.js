
const pluginsucceedif = require('./plugin-succeed-if.js')
const pluginurl = require('./plugin-url.js')

console.log(JSON.stringify({
  status: pluginsucceedif ? 'pass' : 'fail',
  link: pluginurl,
}))
