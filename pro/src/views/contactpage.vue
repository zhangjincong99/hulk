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
          <img src="@/assets/img/zp.png" alt="Contact Image" class="contact-image" />
          <div class="contact-description">
            <p class="text-title">联系方式</p>
            <p class="text-content">0871-68581729</p>
          </div>
        </div>
        <div class="contact-col">
          <img src="@/assets/img/zp.png" alt="Contact Image" class="contact-image" />
          <div class="contact-description">
            <p class="text-title">企业邮箱</p>
            <p class="text-content">md_csny@163.com 销售和市场</p>
            <p>hr_csny@163.com 人力资源</p>
            <p>cs_csny@163.com 客户服务</p>
          </div>
        </div>
        <div class="contact-col">
          <img src="@/assets/img/zp.png" alt="Contact Image" class="contact-image" />
          <div class="contact-description">
            <p class="text-title">微薄</p>
            <p class="text-content">彝运猕猴桃</p>
          </div>
        </div>
        <div class="contact-col">
          <img src="@/assets/img/zp.png" alt="Contact Image" class="contact-image" />
          <div class="contact-description">
            <p class="text-title">公司位置</p>
            <p class="text-content">云南省昆明市西山区华</p>
            <p>昌路128号</p>
          </div>
        </div>
      </div>
    </div>

    <div class="contact-box">
      <div class="contact-row">
        <div class="contact-col" style="flex-basis: 75%;">
          <img src="@/assets/img/dt.png" alt="Contact Image" class="contact-image" />
        </div>
        <div class="contact-col" style="flex-basis: 25%;">
          <img src="@/assets/img/ewm.png" alt="Contact Image" class="contact-image" />
          <div class="contact-description">
            <p class="text-title">关注微信公众号</p>
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
                <el-input type="textarea" v-model="message" class="custom-input"></el-input>
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
.contact-divider {
  display: flex;
  align-items: center;
  margin-top: 20px;
}

.ev-line {
  margin-left: 90px;
  height: 40px;
  border-left: 5px solid rgb(33, 192, 75);
}

.ev-module-edit h3 {
  text-align: left;
  font-size: 24px;
  margin-bottom: 0;
  margin-top: 0;
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
  margin-top: 20px;
  /* border: 1px solid #ccc; */
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
  ;
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

.text-title {
  font-size: 28px;
  margin-left: 0px;
}

.text-content {
  padding-top: 1em;
}
</style>
