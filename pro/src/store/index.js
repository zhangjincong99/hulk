import { createStore } from 'vuex';

export default createStore({
  state: {
    activeMenu: 'home', // 默认选中的菜单项
    islogin: false
  },
  getters: {
  },
  mutations: {
    setActiveMenu(state, menu) {
      state.activeMenu = menu;
    },
    setLoginState(state, isLoggedIn) {
      state.islogin = isLoggedIn; // 更新 islogin 的状态
    }
  },
  actions: {
  },
  modules: {
  }
})
