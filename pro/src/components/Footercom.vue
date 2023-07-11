<!-- Footer.vue -->
<template>
  <footer>
    <p>{{ message }}</p>
  </footer>
</template>

<script>
export default {
  name: 'Footer',
  data() {
    return {
      message: '© 2023 我是尾部. All rights reserved.'
    }
  }
}
</script>

<style scoped>
footer {
  background-color: #f2f2f2;
  padding: 20px;
  text-align: center;
}
</style>
