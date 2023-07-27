<template>
  <headercom-vue></headercom-vue>
  <div class="history">
    <div class="contact-divider">
      <div id="evMo_qA0mS">
        <hr class="ev-line ev-line-10" />
      </div>
      <div class="ev-module-edit">
        <h3>
          <span>
            <strong>公司简介</strong>
          </span>
        </h3>
      </div>
    </div>
    <section class="company-intro">
      <div class="container">
        <div class="founder-details intro-images" v-html="introContent"></div>
      </div>
    </section>
    <div class="contact-divider">
      <div id="evMo_qA0mS">
        <hr class="ev-line ev-line-10" />
      </div>
      <div class="ev-module-edit">
        <h3>
          <span>
            <strong>法人简介</strong>
          </span>
        </h3>
      </div>
    </div>
    <section class="founder-info">
      <div class="container">
        <div class="founder-details intro-images" v-html="founderDetails"></div>
      </div>
    </section>
    <div class="contact-divider">
      <div id="evMo_qA0mS">
        <hr class="ev-line ev-line-10" />
      </div>
      <div class="ev-module-edit">
        <h3>
          <span>
            <strong>企业文化</strong>
          </span>
        </h3>
      </div>
    </div>
    <section class="founder-info">
      <div class="container">
        <div class="founder-details intro-images" v-html="comCulture"></div>
      </div>
    </section>
    <div class="contact-divider">
      <div id="evMo_qA0mS">
        <hr class="ev-line ev-line-10" />
      </div>
      <div class="ev-module-edit">
        <h3>
          <span>
            <strong>资质荣誉</strong>
          </span>
        </h3>
      </div>
    </div>
    <section class="founder-info">
      <div class="container">
        <div class="founder-details intro-images" v-html="honour"></div>
      </div>
    </section>
  </div>
  <footercom-vue></footercom-vue>
</template>
<script>
import FootercomVue from "@/components/Footercom.vue";
import HeadercomVue from "@/components/Headercom.vue";
import axios from "axios";

export default {
  name: "History",
  data() {
    return {
      introContent: "",
      founderDetails: "",
      comCulture: "",
      honour: "",
    };
  },
  components: {
    FootercomVue,
    HeadercomVue,
  },
  beforeMount() {
    this.fetchData();
  },
  methods: {
    fetchData() {
      // 发送异步请求，获取数据
      axios
        .get("http://127.0.0.1:5000/company_data")
        .then((response) => {
          const data = response.data;
          this.introContent = data.com_profile;
          this.founderDetails = data.legal_profile;
          this.comCulture = data.com_culture;
          this.honour = data.honour;
          this.processContentWithImages();
        })
        .catch((error) => {
          console.error("Error fetching data:", error);
        });
    },
    processContentWithImages() {
      // The corrected renderContentWithImages method
      const imgRegex = /<img[^>]+src="([^">]+)"/g;
      const processedIntroContent = this.introContent.replace(
        imgRegex,
        (match, src) => {
          return `<img class="news-image" src="${src}" ref="newsImage" style="max-width: 100%; max-height: 100%; display: block; margin: 0 auto;"`;
        }
      );
      const processedFounderDetails = this.founderDetails.replace(
        imgRegex,
        (match, src) => {
          return `<img class="news-image" src="${src}" ref="newsImage" style="max-width: 100%; max-height: 100%; display: block; margin: 0 auto;"`;
        }
      );
      const processedComCulture = this.comCulture.replace(
        imgRegex,
        (match, src) => {
          return `<img class="news-image" src="${src}" ref="newsImage" style="max-width: 100%; max-height: 100%; display: block; margin: 0 auto;"`;
        }
      );
      const processedHonour = this.honour.replace(imgRegex, (match, src) => {
        return `<img class="news-image" src="${src}" ref="newsImage" style="max-width: 100%; max-height: 100%; display: block; margin: 0 auto;"`;
      });

      this.introContent = processedIntroContent;
      this.founderDetails = processedFounderDetails;
      this.comCulture = processedComCulture;
      this.honour = processedHonour;
    },
  },
};
</script>
<style scoped>
/* 样式布局和美化 */
.history {
  background-color: #f5f5f5;
  padding-top: 20px;
  padding-bottom: 20px;
}

.container {
  max-width: 960px;
  margin: 0 auto;
  padding: 20px;
  line-height: 1.8;
  background-color: white;
}

.intro-content {
  text-align: center;
}

.intro-paragraph {
  margin-bottom: 20px;
  line-height: 2;
  font-size: 20px;
  text-align: justify;
}

.founder {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  margin-top: 30px;
}

.founder-details {
  margin-bottom: 20px;
  line-height: 2;
  font-size: 20px;
  text-align: justify;
}

.contact-divider {
  display: flex;
  align-items: center;
  margin-top: 20px;
}

#evMo_qA0mS {
  margin-right: 20px;
}

.ev-line {
  margin-left: 90px;
  height: 40px;
  border-left: 5px solid rgb(33, 192, 75);
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
</style>