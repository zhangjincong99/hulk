<template>
  <div class="table-container">
    <el-table :data="tableData" style="width: 100%" class="table">
      <el-table-column fixed prop="aid" label="文章ID" width="80" />
      <el-table-column prop="title" label="标题" width="200" />
      <el-table-column prop="time" label="发布时间" width="200">
        <template #default="scope">
          {{ scope.row.time }}
        </template>
      </el-table-column>
      <el-table-column prop="author" label="作者" width="180" />
      <el-table-column fixed="right" label="操作" width="150">
        <template #default="scope">
          <el-button
            link
            type="primary"
            size="small"
            @click="delmyarticle(scope.row.aid)"
            >删除</el-button
          >
          <el-button type="primary" size="small" @click="toedit(scope.row.aid)"
            >编辑</el-button
          >
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { ElMessage, ElMessageBox } from "element-plus";
import { markRaw } from "vue";
import { Delete } from "@element-plus/icons-vue";
import moment from "moment";

export default {
  name: "managearticle",
  data() {
    return {
      tableData: [],
    };
  },
  methods: {
    toedit(aid) {
      this.$router.push("/managehome/managenews/" + aid);
    },
    getMyArticles() {
      this.axios.get("http://127.0.0.1:5000/getmyarticles").then((res) => {
        if (res.data.res == "error") {
          ElMessage.error("程序出错");
          return;
        }
        if (res.data.res != "no") {
          this.tableData = res.data.res.map((item) => {
            const date = moment(item.time);
            const formattedDate = date.format("YYYY-MM-DD");
            return {
              ...item,
              time: formattedDate,
            };
          });
        }
      });
    },
    delmyarticle(aid) {
      ElMessageBox.confirm("是否确认删除此文章", "确认删除？", {
        type: "warning",
        icon: markRaw(Delete),
      })
        .then(() => {
          this.axios
            .get("http://127.0.0.1:5000/delmyarticle?aid=" + aid)
            .then((res) => {
              if (res.data.res == "ok") {
                ElMessage({
                  message: "删除成功",
                  type: "success",
                });
                this.getMyArticles();
              } else {
                ElMessage.error("删除失败");
              }
            });
        })
        .catch(() => {
          // 空的catch处理函数，避免取消按钮点击报错
        });
    },
  },
  mounted() {
    this.getMyArticles();
  },
};
</script>

<style scoped>
.el-button--primary {
  margin-right: 10px;
}

.table-container {
  width: 800px;
  max-height: 600px; /* 设置最大高度以触发内部滚动条 */
  overflow-y: auto; /* 启用垂直滚动条 */
}

.table {
  width: 100%;
}
</style>
