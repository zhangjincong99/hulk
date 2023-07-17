<template>
  <div class="home">
    <Headercom></Headercom>
    <div class="contact-box">
      <div class="contact-header">
        <div class="contact-title" colspan="4">
          <p class="toptext-title">猕 / 猴 / 桃</p>
          <p class="product-title">Kiwifruit</p>
        </div>
      </div>




      <div class="row">
        <div class="column">
          <div>
            <p class="mht-title">猕猴桃</p>
            <p class="text-title">
              褚氏农业由褚时健先生牵头成立，致力于使用现代农业技术和标准化管理体系进行水果种植，同时也开展优质水果品种繁育、种植技术、精深加工技术和工艺等方面的研究。旗下有明星品牌“褚橙”“云冠橙”。
            </p>
            <p class="text-title">
              2002年，褚时健老人在哀牢山深处的戛洒镇种下了第一批冰糖橙，命名褚橙，经过多年精心培育褚橙以其皮薄汁多，黄金甜酸比，清甜化渣，的特性赢得市场口碑，成为最受亚洲人喜爱的甜橙品牌之一，并于2017年达成单品产值近三个亿的优秀成绩。
            </p>
          </div>
        </div>
        <div class="column">
          <div class="image">
            <img src="@/assets/img/轮播4.png" alt="照片">
          </div>
        </div>
      </div>


      <div class="entries">
        <div v-for="entry in timelineEntries" :key="entry.year" class="entry">
          <div class="title" :class="{ big: entry.isBig }">{{ entry.year }}</div>
          <div class="body">
            <p v-for="paragraph in entry.content" :key="paragraph">{{ paragraph }}</p>
          </div>
        </div>
      </div>
    </div>


  </div>
  <!-- <Footercom></Footercom> -->
</template>

<script>
import Headercom from "@/components/Headercom.vue";
// import Footercom from "@/components/Footercom.vue";


export default {
  name: "ContactPage",
  components: {
    Headercom,
    // Footercom,
  },
  data() {
    return {
      timelineEntries: [
        {
          year: 2011,
          isBig: false,
          content: [
            "2011年，褚时健老人在哀牢山深处的戛洒镇种下了第一批冰糖橙",
          ],
        },
        {
          year: 2012,
          isBig: false,
          content: ["2012年，褚橙在全国范围内得到广大消费者的认可，树立了中国农产品的强势品牌"],
        },
        {
          year: 2013,
          isBig: true,
          content: ["Rerum sit libero possimus amet excepturi. Exercitationem enim dolores sunt praesentium dolorum praesentium."],
        },
        {
          year: 2014,
          isBig: false,
          content: [
            "Voluptatibus veniam ea reprehenderit atque. Reiciendis non laborum adipisci ipsa pariatur omnis. Sed ipsam repudiandae velit. Omnis libero nostrum aperiam nemo dolor ea eos eius. Esse a non itaque quidem.",
          ],
        },
        {
          year: 2015,
          isBig: false,
          content: [
            "VAdipisci totam omnis cum et suscipit excepturi et excepturi. Inventore sequi sit ut aliquid. Modi aut dolores dignissimos.",
            "Delectus facere officia consequuntur molestias deserunt illo. Placeat laudantium beatae natus excepturi ab nihil voluptates.",
          ],
        },
        {
          year: 2016,
          isBig: true,
          content: ["Impedit dolorem commodi explicabo fugit aut alias voluptatem. Magnam earum rerum quae dicta quibusdam aliquam ut."],
        },
        {
          year: 2017,
          isBig: false,
          content: ["Qui facere eos aut suscipit doloremque quos..."],
        },
      ],
    };
  },
};
</script>

<style>
.entries {
  width: calc(100% - 80px);
  max-width: 800px;
  margin: auto;
  position: relative;
  left: -5px;
}

.entry {
  width: calc(50% - 80px);
  float: left;
  padding: 20px;
  clear: both;
  text-align: right;
}

.entry:not(:first-child) {
  margin-top: -40px;
}

.entry .title {
  font-size: 32px;
  margin-bottom: 12px;
  position: relative;
  color: #62C46C;
}

.entry .title:before {
  content: "";
  position: absolute;
  width: 8px;
  height: 8px;
  border: 4px solid #62C46C;
  background-color: #62C46C;
  border-radius: 100%;
  top: 50%;
  transform: translateY(-50%);
  right: -73px;
  z-index: 1000;
}

.entry .title.big:before {
  width: 24px;
  height: 24px;
  transform: translate(8px, -50%);
}

.entry .body {
  color: #aaa;
}

.entry .body p {
  line-height: 1.4em;
  font-size: 25px;
}

.entry:nth-child(2n) {
  text-align: left;
  float: right;
}

.entry:nth-child(2n) .title:before {
  left: -63px;
}

.entry:nth-child(2n) .title.big:before {
  transform: translate(-8px, -50%);
}

/* 添加的样式 */
.contact-box {
  margin-top: 20px;
  padding: 10px;
  margin-left: 5%;
  margin-right: 5%;
}

.product-title {
  font-size: 31px;
  color: #66bb6a;
  margin-left: 0px;
}

.row {
  display: flex;
}

.column {
  flex: 50%;
  padding: 10px;
}


.image {
  text-align: center;
}

.image img {
  max-width: 100%;
  height: auto;
}

.text-title {
  font-size: 25px;
  margin-left: 0;
  text-indent: 2em;
  /* 首行缩进2个字符 */
  text-align: left;

}

.mht-title {
  font-size: 31px;
  color: #66bb6a;
  margin-left: 0;
  text-align: left;
}
</style>