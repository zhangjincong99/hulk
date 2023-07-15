<template>
  <div class="login-container">
    <el-form ref="loginForm" :model="loginData" class="login-form">
      <el-form-item label="">
        <h1 class="login-title">管理员登录</h1>
      </el-form-item>
      <el-form-item label="用户名" class="username-input">
        <el-input v-model="username" class="input-field"></el-input>
      </el-form-item>
      <el-form-item label="密码" class="username-input">
        <el-input
          type="password"
          v-model="password"
          class="input-field"
        ></el-input>
      </el-form-item>
      <el-row class="button-row">
        <el-button type="primary" @click="login" class="login-button"
          >登录</el-button
        >
        <el-button type="primary" @click="gobackhome" class="login-button"
          >返回首页</el-button
        >
      </el-row>
    </el-form>
  </div>
</template>

<script>
import { ElMessage } from "element-plus";
import { mapState } from "vuex";

export default {
  name: "login",
  data() {
    return {
      username: "",
      password: "",
    };
  },
  computed: {
    ...mapState(["islogin"]),
  },
  methods: {
    login() {
      let user = this.username.trim();
      let pwd = this.password.trim();

      if (user == "" || pwd == "") {
        ElMessage.error("各项不能为空");
        return;
      }

      let data = {
        user: user,
        pwd: pwd,
      };

      this.axios
        .post("http://127.0.0.1:5001/userlogin", this.qs.stringify(data))
        .then((res) => {
          if (res.data.res === "ok") {
            ElMessage({
              message: "登录成功！",
              type: "success",
            });
            this.$store.commit("setLoginState", true);
            setTimeout(() => {
              this.$router.push("/managehome");
            }, 1000);
          } else {
            ElMessage.error("登录失败！");
            return;
          }
        });
      // 清空表单
      this.$refs.loginForm.resetFields();
    },
    gobackhome() {
      this.$router.push("/");
    },
  },
};
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-size: cover;
  background-position: center;
  background-image: url("@/assets/img/轮播3.png");
}

.login-title {
  text-align: center;
  color: rgb(23, 143, 65);
  font-size: 30px;
  margin-bottom: 20px;
  margin-left: 70px;
}

.login-form .el-form-item {
  margin-bottom: 20px;
  font-size: 20px;
}

.button-row {
  display: flex;
  justify-content: space-between;
}
</style>