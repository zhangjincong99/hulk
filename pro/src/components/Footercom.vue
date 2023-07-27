<template>
  <footer>
    <p>{{ message }}</p>
    <a v-if="isLogin" href="/managehome">返回管理系统</a>
    <a v-else href="/login">管理员登录</a>
  </footer>
</template>

<script>
export default {
  name: 'Footercom',
  data() {
    return {
      message: '© 2023 云南省楚雄市绿巨人生物科技有限公司. All rights reserved.',
      isLogin: false
    }
  },
  mounted() {
    this.axios.post("http://127.0.0.1:5000/islogin").then((res) => {
      if (res.data.res === "yes") {
        this.isLogin = true;
      }
    });
  }
}
</script>

<style scoped>
footer {
  background-color: white;
  padding: 20px;
  text-align: center;
}
</style>
