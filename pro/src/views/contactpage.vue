<template>
  <div class="home">
    <Headercom></Headercom>
    <div class="contact-box">
      <div class="contact-header">
        <div class="contact-title" colspan="4">
          <p class="toptext-title">联系我们</p>
          <p class="product-title">CONTACT US</p>
        </div>
      </div>
      <div class="contact-row">
        <div class="contact-col">
          <img
            src="@/assets/img/zp.png"
            alt="Contact Image"
            class="contact-image"
          />
          <div class="contact-description">
            <p class="text">联系方式</p>
            <p class="text-content">{{contactData.phones}}</p>
          </div>
        </div>
        <div class="contact-col">
          <img
            src="@/assets/img/zp.png"
            alt="Contact Image"
            class="contact-image"
          />
          <div class="contact-description">
            <p class="text">企业邮箱</p>
            <p class="text-content">{{ contactData.email }}</p>
          </div>
        </div>
        <div class="contact-col">
          <img
            src="@/assets/img/zp.png"
            alt="Contact Image"
            class="contact-image"
          />
          <div class="contact-description">
            <p class="text">微薄</p>
            <p class="text-content">彝运猕猴桃</p>
          </div>
        </div>
        <div class="contact-col">
          <img
            src="@/assets/img/zp.png"
            alt="Contact Image"
            class="contact-image"
          />
          <div class="contact-description">
            <p class="text">公司位置</p>
            <p class="text-content">{{ contactData.address }}</p>
          </div>
        </div>
      </div>
    </div>

    <div class="contact-box">
      <div class="contact-row">
        <div class="contact-col" style="flex-basis: 70%">
          <img
            src="@/assets/img/dt.png"
            alt="Contact Image"
            class="contact-image"
          />
        </div>
        <div class="contact-col" style="flex-basis: 30%">
          <img
            src="@/assets/img/ewm.jpg"
            alt="Contact Image"
            class="contact-image"
          />
          <div class="contact-description">
            <p class="text">扫码关注微信公众号</p>
          </div>
        </div>
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
          <div class="contact-info-item">
            <strong class="contact-info-label">电话：</strong>
            <span class="contact-info-content"
              >&nbsp;&nbsp;{{ contactData.phones }}&nbsp;(手机号)</span
            >
          </div>
          <div class="contact-info-item">
            <span class="contact-info-content fax"
              >&nbsp;&nbsp;{{ contactData.fax }}&nbsp;(传真号)</span
            >
          </div>
          <div class="contact-info-item">
            <strong class="contact-info-label">邮箱：</strong>
            <span class="contact-info-content">&nbsp;&nbsp;{{ contactData.email }}</span>
          </div>
          <div class="contact-info-item">
            <strong class="contact-info-label">地址：</strong>
            <span class="contact-info-content">{{ contactData.address }}</span>
          </div>
        </div>
      </div>

      <div class="contact-form">
        <el-form id="contactForm">
          <el-row>
            <el-col :span="50">
              <el-form-item label="您的姓名：">
                <el-input v-model="name"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="50">
              <el-form-item label="您的电话：">
                <el-input v-model="phone"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
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
          <el-row>
            <el-col :span="10">
              <el-button type="primary" @click="submitForm">提交留言</el-button>
            </el-col>
          </el-row>
        </el-form>
      </div>
    </div>
    <Footercom></Footercom>
  </div>
</template>

<script>
import Footercom from "@/components/Footercom.vue";
import Headercom from "@/components/Headercom.vue";
import { ElMessage } from "element-plus";

export default {
  name: "ContactPage",
  components: {
    Headercom,
    Footercom,
  },
  data() {
    return {
      name: "",
      phone: "",
      message: "",
      contactData: {},
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
    fetchContactData() {
      this.axios
        .get("http://127.0.0.1:5000/get_contact")
        .then((response) => {
          this.contactData = response.data;
        })
        .catch((error) => {
          console.error(error);
          alert("请求出错，获取联系信息失败！");
        });
    },
  },
  mounted() {
    this.fetchContactData();
  },
};
</script>

<style>
.contact-info {
  margin-top: 20px;
  margin-left: 250px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  white-space: pre-wrap;
}

.contact-info {
  margin-top: 20px;
  margin-left: 250px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  white-space: pre-wrap;
}

.contact-info-item {
  display: flex;
  align-items: baseline;
  margin-bottom: 5px;
  padding: 5px;
}

.contact-info-label {
  display: inline-block;
  width: 50px; /* 设置标签宽度 */
  font-weight: bold;
}

.contact-info-content {
  display: inline-block; /* 设置为行内块，以便控制宽度 */
  line-height: 24px; /* 设置统一的行高 */
  flex: 1;
}

.contact-form {
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

/* 添加的样式 */
.contact-box {
  padding: 10px;
  margin-left: 5%;
  margin-right: 5%;
}

.contact-header {
  height: 200px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.contact-title {
  font-size: 24px;
  font-weight: bold;
  padding: 10px;
}

.contact-row {
  display: flex;
  flex-wrap: wrap;
}

.contact-col {
  flex-basis: 25%;
  padding: 10px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.contact-image {
  width: 100%;
  height: auto;
  margin-bottom: 10px;
}

.contact-description {
  text-align: center;
}

.toptext-title {
  font-size: 33px;
  margin-left: 0px;
}

.product-title {
  font-size: 23px;
  color: #66bb6a;
  margin-left: 0px;
}

.text {
  font-size: 25px;
  font-weight: bold;
}

.text-content {
  padding-top: 1em;
}
</style>
