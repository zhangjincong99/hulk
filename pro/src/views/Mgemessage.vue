<template>
  <div class="custom-table">
    <el-table
      height="600px"
      style="width: 100%"
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
        label="姓名"
        prop="name"
        width="150"
        align="center"
      ></el-table-column>
      <el-table-column
        label="手机号码"
        prop="phone"
        width="180"
        align="center"
      ></el-table-column>
      <el-table-column
        label="留言内容"
        prop="content"
        width="500"
        align="center"
      ></el-table-column>
      <el-table-column
        label="时间"
        prop="created_tm"
        width="180"
        align="center"
      ></el-table-column>
      <el-table-column label="操作" width="90" align="center">
        <template v-slot="scope">
          <el-button type="danger" @click="deleteRow(scope.row.id)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import axios from "axios";

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
    // 删除行
    deleteRow(id) {
      axios
        .delete(`http://127.0.0.1:5000/mgemessages/${id}`)
        .then((response) => {
          console.log("Deleted:", response.data);
          // 在删除成功后，可以根据需要更新前端的数据，例如从后端重新获取最新的数据
          this.fetchData();
        })
        .catch((error) => {
          console.error("Error:", error);
        });
    },
    fetchData() {
      axios
        .get("http://127.0.0.1:5000/mgemessages")
        .then((response) => {
          this.data = response.data; // 将获取的后端数据赋值给组件的 data 属性
        })
        .catch((error) => {
          console.error("Error:", error);
        });
    },
  },
  mounted() {
    this.fetchData(); // 获取初始数据
  },
};
</script>

<style>
.custom-table {
  width: 1200px;
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
  padding: 6px 12px;
}
</style>
