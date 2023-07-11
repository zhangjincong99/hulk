<template>
  <div class="page-container">
    <div class="header">
      <h1 class="title">绿巨人农业</h1>
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
              公司历史
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
</template>

<script>
export default {
  data() {
    return {
      activeMenu: 'home', // 默认选中的导航项
    };
  },
  methods: {
    handleTabClick(tab) {
      this.activeMenu = tab; // 更新选中的导航项
    },
  },
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
}

.page-container {
  background-color: rgb(245, 235, 225); /* 设置页面背景颜色为浅黄色 */
  padding: 10px;
}

.header {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.title {
  font-size: 38px; /* 设置标题字体大小 */
  color: #0ebd0e;
  margin-right: 20px; /* 标题和导航栏之间的右边距调整 */
  margin-left: 100px; /* 标题距离左边的间距调整 */
}

.navigation {
  display: flex;
}

.navigation td {
  font-size: 20px;
  padding: 10px;
  cursor: pointer;
  margin-right: 50px;
  color: #100a02; /* 设置导航栏字体颜色 */
}

.navigation td.active {
  background-color: orange; /* 导航项选中时的背景颜色为橘黄色 */
}

.nav-link {
  text-decoration: none; /* 去除链接的下划线 */
  color: inherit; /* 继承父元素的颜色 */
}

.nav-link:hover {
  color: orange; /* 鼠标悬停时的字体颜色 */
}
</style>
