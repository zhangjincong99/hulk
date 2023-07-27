<template>
  <div class="custom-header">
    <div class="custom-header-left">
      <img src="../../../public/imgs/header/logo.png" />
    </div>
    <h1 class="custom-header-title">管理员管理系统</h1>
  </div>
  <div class="custom-container custom-index clearfix">
    <div class="custom-setting-left">
      <ul>
        <li
          :class="{ 'custom-active': $route.path === '/managehome/mgemessage' }"
        >
          <router-link to="/managehome/mgemessage">
            <el-icon class="custom-setting-icon">
              <Comment />
            </el-icon>
            留言管理
          </router-link>
        </li>
        <li
          :class="{
            'custom-active': $route.path === '/managehome/managenews/0',
          }"
        >
          <router-link to="/managehome/managenews/0">
            <el-icon class="custom-setting-icon">
              <Memo />
            </el-icon>
            新闻发布
          </router-link>
        </li>
        <li :class="{ 'custom-active': $route.path === '/managehome/mgenews' }">
          <router-link to="/managehome/mgenews">
            <el-icon class="custom-setting-icon">
              <EditPen />
            </el-icon>
            新闻修改
          </router-link>
        </li>
        <li :class="{ 'custom-active': $route.path === '/managehome/account' }">
          <router-link to="/managehome/account">
            <el-icon class="custom-setting-icon">
              <UserFilled />
            </el-icon>
            账户管理
          </router-link>
        </li>
        <li :class="{ 'custom-active': $route.path === '/managehome/profile' }">
          <router-link to="/managehome/profile">
            <el-icon class="custom-setting-icon">
              <Paperclip />
            </el-icon>
            简介管理
          </router-link>
        </li>
        <li
          :class="{
            'custom-active': $route.path === '/managehome/contacemodfily',
          }"
        >
          <router-link to="/managehome/contacemodfily">
            <el-icon class="custom-setting-icon">
              <PhoneFilled />
            </el-icon>
            联系管理
          </router-link>
        </li>
        <li :class="{ 'custom-active': $route.path === '/' }">
          <router-link to="/" @click="handleMoreLinkClick">
            <el-icon class="custom-setting-icon">
              <ArrowLeft />
            </el-icon>
            返回首页
          </router-link>
        </li>
        <li @click="logout">
          <el-icon class="custom-setting-icon">
            <Remove />
          </el-icon>
          退出登录
        </li>
      </ul>
    </div>
    <div class="custom-setting-right">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  name: "headercom",
  computed: {
    ...mapState(["activeMenu"]),
  },
  methods: {
    ...mapMutations(["setActiveMenu"]),
    handleMoreLinkClick() {
      // 这里使用 Vue Router 的 `push` 方法来跳转到指定路由，并将导航栏的 `activeMenu` 设置为对应的路由名称
      this.setActiveMenu("home");
    },
    logout() {
      this.axios
        .post("http://127.0.0.1:5000/exitlogin")
        .then((res) => {
          if (res.data.res === "ok") {
            this.$router.push("/");
          }
        })
        .catch((error) => {
          console.error("Error:", error);
        });
    },
  },

  mounted() {
    this.axios.post("http://127.0.0.1:5000/islogin").then((res) => {
      if (res.data.res == "yes") {
        this.islogin = true;
      } else {
        this.$router.push("/404");
      }
    });
  },
};
</script>

<style>
.custom-header {
  background-color: #333;
  color: white;
  padding: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.custom-header-left {
  margin-right: 10px;
}

.custom-header img {
  width: 50px;
}

.custom-header-title {
  font-size: 24px;
  margin: 0;
}

.custom-container {
  margin-top: 20px;
  display: flex;
}

.custom-setting-left {
  width: 200px;
  margin-right: 20px;
}

.custom-setting-left ul {
  list-style: none;
  padding: 0;
}

.custom-setting-left li {
  height: 40px;
  line-height: 40px;
  cursor: pointer;
}

.custom-setting-left li:hover {
  background-color: #f0f0f0;
}

.custom-setting-icon {
  width: 32px;
  height: 32px;
  color: white;
  background-color: #999;
  border-radius: 4px;
  text-align: center;
}

.custom-active {
  background-color: #f0f0f0;
}

.custom-setting-right {
  flex: 1;
}

.custom-setting-left li a {
  text-decoration: none;
}

.custom-setting-left li a:hover {
  text-decoration: none;
}

.custom-setting-left li a:focus {
  outline: none;
}

.custom-setting-left li a:active {
  outline: none;
}
</style>
