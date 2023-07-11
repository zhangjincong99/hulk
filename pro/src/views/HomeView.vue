<template>
  <div class="home">
    <headercom-vue></headercom-vue>
    <div class="content">
      <div class="intro">
        <div class="item">
          <img src="https://aimg8.dlssyht.cn/u/1896224/ev_user_module_content_tmp/2019_10_14/tmp1571040656_1896224_s.jpg" alt="Image 1" />
        </div>
        <div class="item">
          <img src="https://aimg8.dlssyht.cn/u/1896224/module/simplepicbackground/1896224/10767/21533098_1639445783.jpg?x-oss-process=image/resize,m_fixed,w_401,h_381,limit_0" alt="Image 2" />
          <p class="description">这是第二张图片的介绍文字。</p>
        </div>
        <div class="item">
          <img src="./../assets/img/3.jpg" alt="Image 3" />
          <p class="description">这是第三张图片的介绍文字。</p>
        </div>
      </div>
    </div>
    <footercom-vue></footercom-vue>
  </div>
</template>

<script>
import FootercomVue from "@/components/Footercom.vue";
import HeadercomVue from "@/components/Headercom.vue";

export default {
  name: "HomeView",
  components: {
    HeadercomVue,
    FootercomVue,
  },
};
</script>
