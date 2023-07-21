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
                <span class="product-title">猕猴桃</span>
                <p class="product-paragraph">/产地</p>
              </h4>
              <p class="text-content"></p>
              <p class="product-paragraph">
                云南省玉溪市新平县戛洒镇褚橙庄园
              </p>
              <p class="jinweidu">
                经纬度：E101.55 N24.11
              </p>
              <p class="text-content"></p>
              <p class="product-subtitle">
                庄园位于哀牢山中段东麓，占地6300亩，
              </p>
              <p class="product-subtitle">
                海拔800～900米，年平均气温21～23℃，
              </p>
              <p class="product-subtitle">
                年积温≥7500℃，年降雨量700～900㎜，
              </p>
              <p class="product-subtitle">
                年日照时数为1800～2200小时，
              </p>
              <p class="product-subtitle">
                南亚热带干热河谷地带，拥有广阔的森林覆盖面。
              </p>
              <p class="product-subtitle">
                哀牢山泉水，光照充足，温度适宜，水源丰富，环境优美，空气清新，“天然温室”。
              </p>
            </div>
          </div>

          <div class="contact-box">
            <div class="new-row">
              <div class="new-column">
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
                <p class="text-content"></p>

                <p class="text-new">
                  对果品原料进行一定温度时长的热水处理，促进水果热激蛋白生成，使水果表皮更加紧致，增强果品抗病性和抗逆性。
                </p>
                <p class="text-new">
                  对果品原料进行一定温度时长的热水处理，促进水果热激蛋白生成，使水果表皮更加紧致，增强果品抗病性和抗逆性。
                </p>
              </div>
              <div class="new-column">
                <img src="@/assets/img/金桃猕猴桃.png" alt="图片1" class="new-image" />
              </div>
              <div class="new-column">
                <img src="@/assets/img/dt.png" alt="图片2" class="new-image" />
              </div>
              <div class="new-column">
                <img src="@/assets/img/公司1.png" alt="图片3" class="new-image" />
              </div>
            </div>

            <div class="new-row">
              <div class="new-column">
                <p class="new-text">全新包装</p>
              </div>
              <div class="new-column">
                <img src="@/assets/img/bz1.jpg" alt="图片4" class="new-image" />
              </div>
              <div class="new-column">
                <img src="@/assets/img/bz2.jpg" alt="图片5" class="new-image" />
              </div>
              <div class="new-column">
                <img src="@/assets/img/bz3.jpg" alt="图片6" class="new-image" />
              </div>
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

.location-description {
  flex: 1;
}

.text-box {
  width: 100%;
  height: 100%;
  padding: 20px;
  box-sizing: border-box;
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
  margin-bottom: 0px;
  line-height: 2;
  font-size: 14px;
  text-align: justify;
  margin-left: 30px;
}

.product-paragraph {
  margin-bottom: 0px;
  font-size: 29px;
  text-align: justify;
  margin-left: 30px;
}

.jinweidu {
  margin-bottom: 0px;
  line-height: 2;
  font-size: 23px;
  text-align: justify;
  margin-left: 30px;
  color: gray;
}

.product-new {
  margin-bottom: 0px;
  line-height: 1.7;
  font-size: 16px;
  text-align: justify;
  margin-left: 30px;
  font-weight: bold;
}

.text-new {
  margin-bottom: 0px;
  line-height: 1.7;
  font-size: 14px;
  text-align: justify;
  margin-left: 30px;
}

.text-content {
  padding-top: 1em;
}

.product-tile {
  margin-bottom: 0px;
  line-height: 2;
  font-size: 25px;
  text-align: justify;
  margin-left: 30px;
  height: 50px;
}

.new-row {
  display: flex;
  align-items: center;
  margin-top: 20px;
}

.new-column {
  flex: 1;
  margin-right: 20px;
}

.new-text {
  margin: 0;
  font-size: 25px;
  text-align: justify;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #66bb6a;
}

.new-column img {
  max-width: 100%;
  height: auto;
}

.new-image {
  max-width: 100%;
  height: auto;
}



</style>