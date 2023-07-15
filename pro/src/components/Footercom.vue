<!-- Footer.vue -->
<template>
  <footer>
    <p>{{ message }}</p>
    <a href="/login">管理员登录</a>
  </footer>
</template>

<script>
export default {
  name: 'Footercom',
  data() {
    return {
      message: '© 2023 云南省楚雄市绿巨人生物科技有限公司. All rights reserved.'
    }
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
