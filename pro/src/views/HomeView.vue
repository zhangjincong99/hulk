<template>
  <div class="home">
    <headercom-vue></headercom-vue>
    <div class="content">
      <div class="intro">
        <el-carousel
          trigger="click"
          height="45vw"
          @change="loadAnimate"
          :interval="5000"
          arrow="hover"
          ref="carousel"
        >
          <el-carousel-item v-for="(item, index) in imgurl" :key="index">
            <img :src="item" style="width: 100%; height: auto" />
          </el-carousel-item>
        </el-carousel>
      </div>
    </div>
    <div class="image-description">
      <div class="image">
        <img :src="image.src" :alt="image.alt" />
      </div>
      <div class="description">
        <h3>{{ image.title }}</h3>
        <p>{{ image.description }}</p>
        <a href="#" class="more-link">
          <span>更多</span>
        </a>
      </div>
    </div>
    <div class="img-description">
      <div class="description2">
        <h3>徐香猕猴桃</h3>
        <p>口感独特、风味甜美</p>
        <a href="#" class="more-link-1">
          <span>更多</span>
        </a>
      </div>
      <div class="img1">
        <img
          src="@/assets/img/徐香猕猴桃.png"
          :alt="image.alt"
          style="width: 100%; height: auto"
        />
      </div>
    </div>
    <div class="image-description custom-bg">
      <div class="image">
        <img src="@/assets/img/金桃猕猴桃.png" :alt="image.alt" />
      </div>
      <div class="description custom-bg">
        <h3>金桃猕猴桃</h3>
        <p>与众不同的口味和外观体验</p>
        <a href="#" class="more-link custom-bg">
          <span>更多</span>
        </a>
      </div>
    </div>
    <div class="contact-divider">
      <div id="evMo_qA0mS">
        <hr class="ev-line ev-line-10" />
      </div>
      <div class="ev-module-edit">
        <h3>
          <span>
            <strong>联系我们</strong>
          </span>
        </h3>
      </div>
    </div>
    <div class="contact-section">
      <div class="contact-details">
        <div class="contact-info">
          <p>电话：0871-68581729</p>
          <p>邮箱：md_csny@163.com 销售和市场</p>
          <p>&#8195;&#8195;&#8195;hr_csny@163.com 人力资源</p>
          <p>&#8195;&#8195;&#8195;cs_csny@163.com 客户服务</p>
          <p>地址：云南省昆明市西山区华昌路128号 褚氏农业5楼</p>
        </div>
      </div>

      <div class="contact-form">
        <el-form id="contactForm">
          <el-row :justify="center">
            <el-col :span="50">
              <el-form-item label="您的姓名：">
                <el-input v-model="name"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :justify="center">
            <el-col :span="50">
              <el-form-item label="您的电话：">
                <el-input v-model="phone"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :justify="center">
            <el-col :span="70">
              <el-form-item label="您的留言：">
                <el-input
                  type="textarea"
                  v-model="message"
                  class="custom-input"
                ></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :justify="center">
            <el-col :span="10">
              <el-button type="primary" @click="submitForm">提交留言</el-button>
            </el-col>
          </el-row>
        </el-form>
      </div>
    </div>
    <footercom-vue></footercom-vue>
  </div>
</template>

<script>
import FootercomVue from "@/components/Footercom.vue";
import HeadercomVue from "@/components/Headercom.vue";
import { ElMessage } from "element-plus";

export default {
  name: "HomeView",
  components: {
    HeadercomVue,
    FootercomVue,
  },
  data() {
    return {
      imgurl: [
        require("@/assets/img/轮播4.png"),
        require("@/assets/img/轮播3.png"),
        require("@/assets/img/轮播2.png"),
        require("@/assets/img/轮播1.png"),
      ],
      image: {
        src: require("@/assets/img/图片1.png"),
        alt: "图片描述",
        title: "猕猴桃果汁",
        description: "猕猴桃果汁是一种天然饮品",
      },
      name: "",
      phone: "",
      message: "",
    };
  },
  methods: {
    submitForm() {
      if (this.name == "" || this.phone == "" || this.message == "") {
        ElMessage.error("各项不能为空");
        return;
      }
      if (!/^1(3|4|5|7|8|9)\d{9}$/.test(this.phone)) {
        ElMessage.error("手机号格式不正确");
        return;
      }
      // 发送 GET 请求传递表单数据给后端
      let dataframe = {
        name: this.name,
        phone: this.phone,
        message: this.message,
      };
      this.axios
        .post("http://127.0.0.1:5001/getmessage", this.qs.stringify(dataframe))
        .then((response) => {
          // 请求成功处理逻辑
          if (response.data.res === "success") {
            ElMessage({
              message: "提交成功！",
              type: "success",
            });
            this.name = "";
            this.phone = "";
            this.message = "";
          } else {
            ElMessage.error("提交失败！");
            return;
          }
        })
        .catch((error) => {
          // 请求失败处理逻辑
          console.error(error);
          alert("请求出错，提交失败！");
        });
    },
  },
};
</script>

<style>
.intro {
  width: 100%;
  overflow: hidden;
}

.intro {
  background-color: rgb(23, 143, 65);
  width: auto;
}

.image-description {
  display: flex;
  align-items: center;
  background-color: rgb(23, 143, 65);
  width: 100%;
}

.img-description {
  display: flex;
  align-items: center;
  background-color: white;
  width: 100%;
}

.image-description.custom-bg {
  background-color: #d3b60e; /* 自定义背景颜色 */
}

.image {
  flex: 0 0 auto;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  margin-left: 60px;
}

.description {
  flex: 0 0 50%;
  margin-right: 50px;
}

.description h3 {
  font-size: 36px;
  color: #f0f0f0;
  margin-top: 0;
}

.description p {
  margin-bottom: 10px;
  font-size: 28px;
  color: #f0f0f0;
}

.description.custom-bg {
  flex: 0 0 50%;
  margin-right: 50px;
}
.description.custom-bg h3 {
  font-size: 36px;
  color: yellow;
  margin-top: 0;
}
.description.custom-bg p {
  margin-bottom: 10px;
  font-size: 28px;
  color: yellow;
}

.img1 {
  flex: 0 0 auto;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  margin-right: 0;
}


.description2 {
  flex: 0 0 50%;
  margin-right: 50px;
}

.description2 h3 {
  font-size: 36px;
  color: #121111;
  margin-top: 0;
}

.description2 p {
  margin-bottom: 10px;
  font-size: 28px;
  color: #121111;
}

.more-link {
  display: inline-block;
  padding: 10px 15px;
  border: 1px solid #f0f0f0;
  text-decoration: none;
  color: #f0f0f0;
}

.more-link span {
  display: inline-block;
  font-weight: bold;
}

.more-link:hover {
  background-color: #f0f0f0;
}

.more-link-1 {
  display: inline-block;
  padding: 10px 15px;
  border: 1px solid black;
  text-decoration: none;
  color: black;
}

.more-link-1 span {
  display: inline-block;
  font-weight: bold;
}

.more-link-1:hover {
  background-color: black;
}

.more-link.custom-bg {
  display: inline-block;
  padding: 10px 15px;
  border: 1px solid yellow;
  text-decoration: none;
  color: yellow;
}

.more-link.custom-bg span {
  display: inline-block;
  font-weight: bold;
}

.more-link.custom-bg:hover {
  background-color: yellow;
}

/* 联系我们布局 */
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
}

.ev-module-edit h3 {
  text-align: left;
  font-size: 24px;
  margin-bottom: 0;
  margin-top: 0;
}

.contact-section {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-top: 5px;
  width: 100%;
}
.contact-details {
  flex-basis: 50%;
}

.contact-info {
  margin-top: 20px;
  margin-left: 250px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  white-space: pre-wrap;
}

.contact-info p {
  margin-bottom: 5px;
  padding: 7px;
}

.contact-form {
  flex-basis: 50%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-left: 20px;
  margin-top: 20px;
}

.contact-form .el-form-item {
  width: 100%;
  margin-bottom: 7px;
}
.contact-form .el-row {
  margin-bottom: 10px;
}

.contact-form .el-button {
  align-self: flex-end;
  margin-left: 150px;
  margin-top: 10px;
  background-color: rgb(23, 143, 65);
}

.custom-input {
  width: 100%;
}
</style>