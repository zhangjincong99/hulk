<template>
  <headercom-vue></headercom-vue>
  <div class="product-display">
    <section class="product-details">
      <div class="container">
        <div class="product-info">
          <div class="location-image">
            <img src="@/assets/img/公司.png" alt="Chu Oranges Image" />
          </div>

          <div class="location-description">
            <div class="text-box">
              <h4>
                <span class="product-title">猕猴桃</span
                ><span class="product-paragraph">/产地</span>
              </h4>
              <p class="product-paragraph">
                云南省玉溪市新平县戛洒镇褚橙庄园是我们褚橙的产地。
              </p>
              <p class="product-paragraph">
                <span class="product-subtitle">庄园位于哀牢山中段东麓，占地6300亩，</span>
              </p>
              <p class="product-paragraph">
                <span class="product-subtitle">海拔800～900米，年平均气温21～23℃，</span>
              </p>
              <p class="product-paragraph">
                <span class="product-subtitle">年积温≥7500℃，年降雨量700～900㎜，</span>
              </p>
              <p class="product-paragraph">
                <span class="product-subtitle">年日照时数为1800～2200小时，</span>
              </p>
              <p class="product-paragraph">
                <span class="product-subtitle">南亚热带干热河谷地带，拥有广阔的森林覆盖面。</span>
              </p>
              <p class="product-paragraph">
                <span class="product-subtitle">哀牢山泉水，光照充足，温度适宜，水源丰富，环境优美，空气清新，“天然温室”。</span>
              </p>
            </div>
          </div>

          <div class="location-images">
            <div class="location-description">
              <div class="text-box">
                <p class="product-tile">
                  <span>分选</span>
                </p>
                <p class="product-new">
                  <span>新技术严格分选</span>
                </p>
                <p class="product-new">
                  <span>清洗并剔除瑕疵果</span>
                </p>
                <p class="product-new">
                  <span>无损测糖果重分级</span>
                </p>
                <p class="product-new">
                  <span>对果品原料进行一定温度时长的热水处理，促进水果热激蛋白生成，使水果表皮更加紧致，增强果品抗病性和抗逆性。</span>
                </p>
                <p class="product-new">
                  <span>对果品原料进行一定温度时长的热水处理，促进水果热激蛋白生成，使水果表皮更加紧致，增强果品抗病性和抗逆性。</span>
                </p>
              </div>
            </div>
            <div class="location-image">
              <img src="@/assets/img/金桃猕猴桃.png" alt="Image 1" />
            </div>
            <div class="location-image">
              <img src="@/assets/img/金桃猕猴桃.png" alt="Image 2" />
            </div>
            <div class="location-image">
              <img src="@/assets/img/金桃猕猴桃.png" alt="Image 3" />
            </div>
          </div>

          <div class="location-images">
            <div class="text-new" rows="6">
              <p>全新包装</p>
            </div>
            <div class="new-image">
              <img src="@/assets/img/公司.png" alt="Image 4" class="animate-right" />
            </div>
            <div class="new-image">
              <img src="@/assets/img/公司.png" alt="Image 5" class="animate-right delay-1s" />
            </div>
            <div class="new-image">
              <img src="@/assets/img/公司1.png" alt="Image 6" class="animate-right delay-2s" />
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <footercom-vue></footercom-vue>
</template>

<script>
import Carousel from 'vue-carousel';
import FootercomVue from '@/components/Footercom.vue';
import HeadercomVue from '@/components/Headercom.vue';

export default {
  name: "ProductsPage",
  components: {
    Carousel,
    FootercomVue,
    HeadercomVue,
  },
  mounted() {
    this.animateImages();
  },
  methods: {
    animateImages() {
      const images = document.querySelectorAll('.animate-right');
      images.forEach((image, index) => {
        image.style.animationDelay = `${index + 1}s`;
        image.style.opacity = '1';
      });
    },
  },
};
</script>

<style scoped>
.product-display {
  background-color: #f5f5f5;
  padding-top: 20px;
  padding-bottom: 20px;
}

.container {
  max-width: 100%;
  margin: 0 auto;
  padding: 20px;
  background-color: white;
}

.product-info {
  display: flex;
  flex-wrap: wrap;
}

.location-image {
  flex: 1;
  margin-right: 20px;
}

.location-image img {
  max-width: 100%;
  height: auto;
}

.new-image {
  flex: 1;
  margin-right: 20px;
}

.new-image img {
  max-width: 100%;
  height: auto;
  opacity: 0;
  transition: opacity 0.5s, transform 0.5s;
}

.animate-right {
  animation: slideRight 1s forwards;
}

.delay-1s {
  animation-delay: 1s;
}

.delay-2s {
  animation-delay: 2s;
}

.location-description {
  flex: 1;
}

.text-box {
  width: 100%;
  height: 100%;
  padding: 20px;
  box-sizing: border-box;
}

.text-new {
  width: 400px;
  height: 480px;
  font-size: 45px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.location-images {
  display: flex;
  align-items: flex-start;
  margin-top: 20px;
}

.location-images .location-image {
  flex: 1;
  margin-right: 20px;
}

.product-info h4 {
  margin-top: 20px;
  display: flex;
  align-items: center;
  margin-left: 30px;
}

.product-title {
  font-size: 45px;
  color: #66bb6a;
  margin-left: 0px;
}

.product-subtitle {
  font-size: 20px;
  margin-left: 0px;
}

.product-paragraph {
  margin-bottom: 0px;
  line-height: 2;
  font-size: 30px;
  text-align: justify;
  margin-left: 30px;
}

.product-new {
  margin-bottom: 0px;
  line-height: 1.5;
  font-size: 16px;
  text-align: justify;
  margin-left: 30px;
  height: 75px;
}

.product-tile {
  margin-bottom: 0px;
  line-height: 2;
  font-size: 25px;
  text-align: justify;
  margin-left: 30px;
  height: 50px;
}

.contact-divider {
  display: none;
}

.ev-line {
  display: none;
}

.ev-module-edit {
  display: none;
}

.ev-module-edit h3 {
  display: none;
}

.content-container {
  display: flex;
  align-items: center;
}

.content-container input {
  margin-right: 10px;
}

.carousel-container {
  display: flex;
}

.carousel-container img {
  max-width: 100%;
  height: auto;
  margin-right: 10px;
}

.ev-module-edit {
  display: flex;
  align-items: center;
  margin-left: 20px;
}

.ev-module-edit h3 {
  text-align: left;
  font-size: 24px;
  margin-bottom: 0;
  margin-top: 0;
}

.baozhuang-tile {
  margin-bottom: 0px;
  line-height: 2;
  font-size: 25px;
  text-align: justify;
  margin-left: 30px;
  height: 50px;
}
</style>
