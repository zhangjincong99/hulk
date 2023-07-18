<template>
  <div class="custom-table">
    <el-table
      style="width: 900px"
      height="550px"
      border
      size="small"
      :data="data"
      @selection-change="handleSelectionChange"
    >
      <el-table-column
        label="ID"
        prop="id"
        width="100px"
        align="center"
      ></el-table-column>
      <el-table-column
        label="用户名"
        prop="username"
        width="250px"
        align="center"
      ></el-table-column>
      <el-table-column
        label="密码"
        prop="password"
        width="250px"
        align="center"
      ></el-table-column>
      <el-table-column label="操作" width="150px" align="center">
        <template v-slot="scope">
          <el-button type="primary" @click="updatePassword(scope.row.id)"
            >修改密码</el-button
          >
        </template>
      </el-table-column>
      <el-table-column label="操作" width="150px" align="center">
        <template v-slot="scope">
          <el-button type="danger" @click="deleteUser(scope.row.id)"
            >删除账户</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <el-button type="primary" @click="addUser" class="button"
      >添加管理员</el-button
    >
    <el-button @click="fetchData">刷新数据</el-button>
  </div>
</template>

<script>
import axios from "axios";
import { ElMessage, ElMessageBox } from "element-plus";

export default {
  data() {
    return {
      data: [], // 存放后端数据的数组
    };
  },
  methods: {
    // 处理选中行变化的回调函数
    handleSelectionChange(selection) {
      console.log("Selection Changed:", selection);
    },
    // 删除用户
    deleteUser(id) {
      axios
        .delete(`http://127.0.0.1:5000/manageusers/${id}`)
        .then((response) => {
          ElMessage({
            message: "删除成功！",
            type: "success",
          });
          // 在删除成功后，可以根据需要更新前端的数据，例如从后端重新获取最新的数据
          this.fetchData();
        })
        .catch((error) => {
          ElMessage({
            message: "删除失败！",
            type: "error",
          });
        });
    },
    // 更新密码
    updatePassword(id) {
      ElMessageBox.prompt("请输入新密码", "修改密码", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        inputType: "password",
        inputPattern: /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/,
        inputErrorMessage:
          "密码必须包含至少一个字母和一个数字，且长度至少为8位",
      })
        .then((value) => {
          const newPassword = value;
          // 发送请求更新密码
          axios
            .put(`http://127.0.0.1:5000/manageusers/${id}`, {
              password: newPassword,
            })
            .then((response) => {
              ElMessage({
                message: "密码更新成功！",
                type: "success",
              });
            })
            .catch((error) => {
              ElMessage({
                message: "密码更新失败！",
                type: "error",
              });
            });
        })
        .catch(() => {
          // 用户取消输入密码
        });
    },
    fetchData() {
      axios
        .get("http://127.0.0.1:5000/manageusers")
        .then((response) => {
          this.data = response.data; // 将获取的后端数据赋值给组件的 data 属性
        })
        .catch((error) => {
          console.error("Error:", error);
        });
    },
    addUser() {
      ElMessageBox({
        title: "添加管理员",
        message: "请输入用户名和密码",
        showCancelButton: true,
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        showInput: true,
        inputPlaceholder: "请输入用户名",
        inputPattern: /^[a-zA-Z0-9_-]{4,16}$/,
        inputErrorMessage:
          "用户名格式不正确，请输入4-16位的字母、数字、下划线或短横线",
        inputType: "text",
      })
        .then((username) => {
          if (!username) {
            // 用户取消输入用户名
            return;
          }
          ElMessageBox.prompt("请输入密码", "添加管理员", {
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            inputType: "password",
            inputPattern: /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/,
            inputErrorMessage:
              "密码必须包含至少一个字母和一个数字，且长度至少为8位",
            inputPlaceholder: "请输入密码",
            showCancelButton: true,
          })
            .then((password) => {
              if (!password) {
                // 用户取消输入密码
                return;
              }
              // 发送请求添加管理员
              axios
                .post("http://127.0.0.1:5000/addmanageusers", {
                  username,
                  password,
                })
                .then((response) => {
                  ElMessage({
                    message: "添加管理员成功！",
                    type: "success",
                  });
                  // 在添加成功后，可以根据需要更新前端的数据，例如从后端重新获取最新的数据
                  this.fetchData();
                })
                .catch((error) => {
                  ElMessage({
                    message: "添加管理员失败！",
                    type: "error",
                  });
                });
            })
            .catch(() => {
              // 用户取消输入密码
            });
        })
        .catch(() => {
          // 用户取消输入用户名
        });
    },
  },
  mounted() {
    this.fetchData(); // 获取初始数据
  },
};
</script>

<style>
.custom-table .el-table {
  width: 530px;
  margin-left: 10px;
}

.custom-table .el-table .el-table__header-wrapper {
  background-color: #f0f0f0;
}

.custom-table .el-table .el-table__header th {
  color: #333;
  font-weight: bold;
}

.custom-table .el-table .el-table__body td {
  text-align: center;
}

.custom-table .el-table .el-button {
  padding: 6px 20px;
}

.button {
  margin-left: 360px;
}
</style>
