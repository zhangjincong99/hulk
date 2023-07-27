import { createStore } from 'vuex';

export default createStore({
  state: {
    activeMenu: sessionStorage.getItem('activeMenu') || 'home',
  },
  getters: {
  },
  mutations: {
    setActiveMenu(state, menu) {
      state.activeMenu = menu;
      sessionStorage.setItem('activeMenu', menu);
    },
  },
  actions: {
  },
  modules: {
  }
})
