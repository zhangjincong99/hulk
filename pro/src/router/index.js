import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import News from '../views/News.vue'
import History from '../views/History.vue'
import Managehome from '../views/manage/Managehome.vue'
import Login from '../views/manage/Login.vue'
import Notfoundpage from '../views/Notfoundpage.vue'
import Shownews from '../views/Shownews.vue'
import Managenews from '../views/Managenews.vue'
import Mgemessage from '../views/Mgemessage.vue'
import Account from '../views/Account.vue'
import Mgenews from '../views/Mgenews.vue'
import AboutKiwi from '../views/AboutKiwiPage.vue'
import Product from '../views/productspage.vue'
import Contact from '../views/contactpage.vue'
import Profile from '../views/Profile.vue'
import Contacemodfily from '../views/manage/Contact.vue'


const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    component: function () {
      return import('../views/AboutView.vue')
    }
  },
  {
    path: '/news',
    name: 'news',
    component: News
  },
  {
    path: '/history',
    name: history,
    component: History
  },
  {
    path: '/managehome',
    name: Managehome,
    component: Managehome,
    children:[
      {
        path: 'managenews/:aid',
        name: "Managenews",
        component: Managenews
      },
      {
        path: 'mgemessage',
        name: "Mgemessage",
        component: Mgemessage
      },
      {
        path: 'account',
        name: "Account",
        component: Account
      },
      {
        path: 'mgenews',
        name: "Mgenews",
        component: Mgenews
      },
      {
        path: 'profile',
        name: "Profile",
        component: Profile
      },
      {
        path: 'contacemodfily',
        name: "Contacemodfily",
        component: Contacemodfily
      }
    ]
  },
  {
    path: '/login',
    name: Login,
    component: Login
  },
  {
    path: '/404',
    name: 'notfoundpage',
    component: Notfoundpage
  },
  {
    path: '/news/:id',
    name: Shownews,
    component: Shownews
  },
  {
    path: '/products',
    name: Product,
    component: Product
  },
  {
    path: '/contact',
    name: Contact,
    component: Contact
  },
  {
    path: '/aboutKiwi',
    name: AboutKiwi,
    component: AboutKiwi
  },

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
