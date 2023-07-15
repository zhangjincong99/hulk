<template>
  <div class="page-container">
    <div class="header">
      <div class="nav-container">
        <img class="logo" src="@/assets/img/商标图.jpg" alt="" />
        <table class="navigation">
          <tr>
            <td>
              <router-link
                to="/"
                class="nav-link"
                :class="{ active: activeMenu === 'home' }"
                @click="handleTabClick('home')"
                exact
              >
                首页
              </router-link>
            </td>
            <td>
              <router-link
                to="/about-kiwi"
                class="nav-link"
                :class="{ active: activeMenu === 'kiwi' }"
                @click="handleTabClick('kiwi')"
              >
                关于猕猴桃
              </router-link>
            </td>
            <td>
              <router-link
                to="/news"
                class="nav-link"
                :class="{ active: activeMenu === 'news' }"
                @click="handleTabClick('news')"
              >
                新闻公告
              </router-link>
            </td>
            <td>
              <router-link
                to="/products"
                class="nav-link"
                :class="{ active: activeMenu === 'products' }"
                @click="handleTabClick('products')"
              >
                产品展示
              </router-link>
            </td>
            <td>
              <router-link
                to="/history"
                class="nav-link"
                :class="{ active: activeMenu === 'history' }"
                @click="handleTabClick('history')"
              >
                公司简介
              </router-link>
            </td>
            <td>
              <router-link
                to="/contact"
                class="nav-link"
                :class="{ active: activeMenu === 'contact' }"
                @click="handleTabClick('contact')"
              >
                联系我们
              </router-link>
            </td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import { mapMutations, mapState } from "vuex";

export default {
  name: "Headercom",
  computed: {
    ...mapState(["activeMenu"]),
  },
  methods: {
    ...mapMutations(["setActiveMenu"]),
    handleTabClick(menu) {
      this.setActiveMenu(menu); // 更新当前选中的菜单项为点击的菜单项
    },
  },
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
}

.logo {
  width: 10%;
  height: auto;
  margin-left: 180px;
  margin-right: -10px;
}

.nav-container {
  display: flex;
  align-items: center;
}

.page-container {
  background-color: rgb(240, 225, 210); /* 设置页面背景颜色为浅黄色 */
  padding: 10px;
}

.header {
  display: flex;
  align-items: center;
}

.navigation {
  display: flex;
  align-items: center;
}

.navigation td {
  font-size: 20px;
  padding: 20px;
  cursor: pointer;
  color: #100a02; /* 设置导航栏字体颜色 */
}

.nav-link {
  text-decoration: none; /* 去除链接的下划线 */
  color: inherit; /* 继承父元素的颜色 */
}

.nav-link:hover {
  color: #100a02; /* 鼠标悬停时的字体颜色 */
}

/* 添加用于改变导航栏颜色的CSS类 */
.active {
  border: 1px solid #0ebd0e;
  background-color: #0ebd0e; /* 或者其他你想要的颜色 */
  padding: 20px; /* 设置宽度 */
  margin: 20px;
}
</style>
