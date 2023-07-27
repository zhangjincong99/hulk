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
            <!-- <p class="mht-title">猕猴桃</p> -->
            <p class="text-title">
<<<<<<< HEAD
               猕猴桃（拉丁学名：Actinidia chinensis Planch.），中文名为
              中华猕猴桃 ，俗名为 藤梨 、羊桃藤、 阳桃 、 奇异果 、几维果等，
              杜鹃花目 猕猴桃科 猕猴桃属 植物。
            </p>
            <p class="text-title">
              猕猴桃是一种营养价值极高的水果，被誉为“水果之王”。
              它含有亮氨酸、苯丙氨酸、异亮氨酸、酪氨酸、丙氨酸等十多种氨基酸，以及丰富的矿物质，包括丰富的钙、磷、铁，还含有胡萝卜素和多种维生素。
=======
               猕猴桃（拉丁学名：Actinidia chinensis Planch.），中文名为 中华猕猴桃 ，俗名为 藤梨 、羊桃藤、 阳桃 、 奇异果 、几维果等， 杜鹃花目 猕猴桃科 猕猴桃属 植物。
            </p>
            <p class="text-title">
              猕猴桃是一种营养价值极高的水果，被誉为“水果之王”。 它含有亮氨酸、苯丙氨酸、异亮氨酸、酪氨酸、丙氨酸等十多种氨基酸，以及丰富的矿物质，包括丰富的钙、磷、铁，还含有胡萝卜素和多种维生素。
>>>>>>> b33ef7ca9ff25562a77743520dd771e682768784
              多食用猕猴桃可以预防老年骨质疏松，抑制胆固醇的沉积，从而防治动脉硬化，还可改善心肌功能,防治心脏病等，也能对抗癌起到一点儿作用。
            </p>
          </div>
        </div>
        <div class="column">
          <div class="image">
            <img src="@/assets/img/轮播4.png" alt="照片" />
          </div>
        </div>
      </div>
<<<<<<< HEAD

      <div class="entries">
        <div v-for="entry in timelineEntries" :key="entry.month" class="entry">
          <div class="title" :class="{ big: entry.isBig }">
            {{ entry.month }}
          </div>
=======
      <div class="entries">
        <div v-for="entry in timelineEntries" :key="entry.month" class="entry">
          <div class="title" :class="{ big: entry.isBig }">{{ entry.month }}</div>
>>>>>>> b33ef7ca9ff25562a77743520dd771e682768784
          <div class="body">
            <p v-for="paragraph in entry.content" :key="paragraph">
              {{ paragraph }}
            </p>
          </div>
        </div>
<<<<<<< HEAD
      </div>
      <div class="foot"><Footercom></Footercom></div>
=======
      </div> 
>>>>>>> b33ef7ca9ff25562a77743520dd771e682768784
    </div>
  </div>
</template>

<script>
import Headercom from "@/components/Headercom.vue";
import Footercom from "@/components/Footercom.vue";

export default {
  name: "ContactPage",
  components: {
    Headercom,
    Footercom,
  },
  data() {
    return {
      timelineEntries: [
        {
          month: "1月~2月",
          isBig: false,
<<<<<<< HEAD
          content: [" 花芽分、花蕾现"],
=======
          content: [
            " 花芽分、花蕾现",
          ],
>>>>>>> b33ef7ca9ff25562a77743520dd771e682768784
        },
        {
          month: "3月",
          isBig: false,
          content: ["繁花"],
        },
        {
          month: "4月~5月",
          isBig: true,
          content: ["结果"],
        },
        {
          month: "8月",
          isBig: false,
<<<<<<< HEAD
          content: ["盛果"],
=======
          content: [
            "盛果",
          ],
>>>>>>> b33ef7ca9ff25562a77743520dd771e682768784
        },
        {
          month: "9月",
          isBig: false,
<<<<<<< HEAD
          content: ["月青果转黄"],
=======
          content: [
            "月青果转黄",
          ],
>>>>>>> b33ef7ca9ff25562a77743520dd771e682768784
        },
        {
          month: "10月底",
          isBig: true,
          content: ["月底果熟待采"],
        },
        {
          month: "11月初",
          isBig: false,
          content: ["初采果 应季上市"],
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
  color: #62c46c;
}

.entry .title:before {
  content: "";
  position: absolute;
  width: 8px;
  height: 8px;
  border: 4px solid #62c46c;
  background-color: #62c46c;
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
  font-size: 23px;
  margin-left: 0;
  text-indent: 2em;
  /* 首行缩进2个字符 */
  text-align: left;
  color: gray;
<<<<<<< HEAD
=======

>>>>>>> b33ef7ca9ff25562a77743520dd771e682768784
}

.mht-title {
  font-size: 31px;
  color: #66bb6a;
  margin-left: 0;
  text-align: left;
}

.foot {
  margin-top: 650px;
}
</style>