<template>
  <div class="app-container">
    <header>
      <HeadercomVue />
    </header>

    <main>
      <router-view />
    </main>

    <footer>
      <FootercomVue />
    </footer>
  </div>
</template>

<script>
import FootercomVue from "@/components/Footercom.vue";
import HeadercomVue from "@/components/Headercom.vue";

export default {
  components: {
    FootercomVue,
    HeadercomVue,
  },
};
</script>

<style>
.app-container {
  /* 添加整体布局样式 */
}
</style>
