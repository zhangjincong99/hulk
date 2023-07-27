<template>
  <div class="custom-table">
    <el-table
      height="510px"
      style="width: 100%"
      border
      size="small"
      :data="pagedData"
      :default-sort="{ prop: 'id', order: 'ascending' }"
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
  <div class="pagination-container">
    <el-pagination
      class="pagination"
      background
      layout="prev, pager, next, total"
      :current-page="currentPage"
      :page-size="pageSize"
      :total="total"
      @current-change="handleCurrentPageChange"
    >
    </el-pagination>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      tableData: [], // 存放后端数据的数组
      pagedData: [], // 当前页展示的数据
      currentPage: 1, // 当前页码
      pageSize: 10, // 每页展示的条数
      total: 0, // 总条数
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
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize - 1;
      axios
        .get(`http://127.0.0.1:5000/mgemessages?start=${start}&end=${end}`)
        .then((response) => {
          this.tableData = response.data.data; // 将获取的后端数据赋值给组件的 tableData 属性
          this.total = response.data.total; // 设置总条数
          this.updatePagedData(); // 更新当前页展示的数据
        })
        .catch((error) => {
          console.error("Error:", error);
        });
    },
    updatePagedData() {
      const startIndex = (this.currentPage - 1) * this.pageSize;
      const endIndex = Math.min(
        startIndex + this.pageSize,
        this.tableData.length
      );
      const startIndex1 = 0;
      this.pagedData = this.tableData.slice(startIndex1, endIndex);
    },
    handlePageSizeChange(pageSize) {
      this.pageSize = pageSize;
      this.currentPage = 1; // 重置为第一页
      this.fetchData();
    },
    handleCurrentPageChange(currentPage) {
      this.currentPage = currentPage;
      this.fetchData();
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

.pagination-container {
  margin-top: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
