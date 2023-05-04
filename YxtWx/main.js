
// #ifndef VUE3
import Vue from 'vue'
import App from './App'
import moment from 'moment'
import tabBar from './components/tabbar/tabbar.vue'

Vue.config.productionTip = false

App.mpType = 'app'

Vue.prototype.$moment = moment // 全局挂载moment.js
Vue.component('tab-bar',tabBar)

const app = new Vue({
    ...App
})
app.$mount()

// #endif

// #ifdef VUE3
import { createSSRApp } from 'vue'
import App from './App.vue'
export function createApp() {
  const app = createSSRApp(App)
  return {
    app
  }
}
// #endif