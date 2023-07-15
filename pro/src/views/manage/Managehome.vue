<template>
  <div class="setting">
    <h1>管理员管理系统</h1>
    <el-tabs tab-position="left" class="custom-tabs">
      <el-tab-pane label="留言管理" class="content">
        <MgemessageVue></MgemessageVue>
      </el-tab-pane>
      <el-tab-pane label="新闻公告管理" class="content">
        <Managenews></Managenews>
      </el-tab-pane>
      <el-tab-pane label="账户管理" class="content">
        <AccountVue></AccountVue>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import Managenews from "../Managenews.vue";
import AccountVue from "../Account.vue";
import MgemessageVue from "../Mgemessage.vue";

export default {
  name: "headercom",
  data() {
    return {
      islogin: false,
    };
  },
  components: {
    Managenews,
    AccountVue,
    MgemessageVue,
  },
  mounted() {
    this.axios.post("http://127.0.0.1:5001/islogin").then((res) => {
      if (res.data.res == "yes") {
        this.islogin = true;
      }else{
        this.$router.push("/404")
      }
    });
  },
};
</script>

<style>
.setting {
  padding: 20px;
}

.custom-tabs .el-tabs__header {
  background-color: #f0f0f0;
  border: none;
  border-right: 1px solid #ebebeb;
}

.custom-tabs .el-tabs__item {
  color: #333;
  font-size: 16px;
}

.custom-tabs .el-tabs__item.is-active {
  color: #1890ff;
}

.custom-tabs .el-tabs__content {
  padding: 20px;
}
</style>
