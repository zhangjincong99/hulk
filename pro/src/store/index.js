import { createStore } from 'vuex';

export default createStore({
  state: {
    activeMenu: 'home', // 默认选中的菜单项
  },
  getters: {
  },
  mutations: {
    setActiveMenu(state, menu) {
      state.activeMenu = menu;
    },
  },
  actions: {
  },
  modules: {
  }
})
