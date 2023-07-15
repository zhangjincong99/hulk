import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import qs from 'qs'
import ElementPlus from "element-plus"
import "element-plus/dist/index.css"
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

const app = createApp(App)

//全局配置ico
for (let i in ElementPlusIconsVue) {
    app.component(i, ElementPlusIconsVue[i])
}

//全局配置axios
axios.defaults.withCredentials = true

app.config.globalProperties.axios = axios

//全局绑定qs
app.config.globalProperties.qs = qs

app.use(ElementPlus)

app.use(store).use(router).mount('#app')
