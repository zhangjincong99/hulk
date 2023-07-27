<template>
  <div class="contact-management">
    <div class="cinfo">
      <div class="contact-info-item">
        <strong class="c-label">电话：</strong>
        <el-input v-model="contactData.phones" style="width: 200px"></el-input>
      </div>
      <div class="contact-info-item">
        <strong class="c-label">传真：</strong>
        <el-input v-model="contactData.fax" style="width: 200px"></el-input>
      </div>
      <div class="contact-info-item">
        <strong class="c-label">邮箱：</strong>
        <el-input v-model="contactData.email" style="width: 200px"></el-input>
      </div>
      <div class="contact-info-item">
        <strong class="c-label">地址：</strong>
        <el-input v-model="contactData.address" style="width: 500px"></el-input>
      </div>
    </div>
    <div class="save-button">
      <el-button type="primary" @click="saveContactData">保存修改</el-button>
    </div>
  </div>
</template>

<script>
import { ElInput, ElButton, ElMessage } from "element-plus";

export default {
  name: "ContactManagement",
  components: {
    ElInput,
    ElButton,
  },
  data() {
    return {
      contactData: {},
    };
  },
  methods: {
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
    saveContactData() {
      this.axios
        .post("http://127.0.0.1:5000/update_contact", this.contactData)
        .then((response) => {
          ElMessage({
            message: "联系信息更新成功！",
            type: "success",
          });
        })
        .catch((error) => {
          console.error(error);
          ElMessage.error("联系信息更新失败！");
        });
    },
  },
  mounted() {
    this.fetchContactData();
  },
};
</script>

<style>
.contact-management {
  margin: 20px;
}

.contact-info {
  margin-top: 20px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}

.contact-info-item {
  display: flex;
  align-items: baseline;
  margin-bottom: 10px;
}

.c-label {
  display: inline-block;
  width: 60px;
}

.contact-info-content {
  display: inline-block;
  flex: 1;
}

.el-button {
  margin-top: 20px;
}
</style>
