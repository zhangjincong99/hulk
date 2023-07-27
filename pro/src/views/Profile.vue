<template>
  <div>
    <el-form label-width="120px">
      <el-form-item label="简介分类：">
        <el-select
          v-model="category"
          placeholder="请选择简介分类"
          @change="fetchData"
        >
          <el-option label="公司简介" value="1" />
          <el-option label="法人简介" value="2" />
          <el-option label="企业文化" value="3" />
          <el-option label="资质荣誉" value="4" />
        </el-select>
      </el-form-item>
      <el-form-item label="简介内容：" class="content-item">
        <div class="file-upload">
          <input
            type="file"
            hidden
            id="fileBtn"
            @change="handleUpload($event)"
          />

          <QuillEditor
            :options="options"
            style="height: 450px; width: 505px"
            v-model:content="content"
            contentType="html"
            ref="QuillEditor"
            id="editor"
          />
        </div>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" color="#009966" @click="uparticle">
          保存文章
        </el-button>
        <el-button @click="clearcon">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { QuillEditor } from "@vueup/vue-quill";
import { ElMessage } from "element-plus";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
import axios from "axios";

export default {
  data() {
    return {
      aid: 0,
      category: "",
      content: "",
      options: {
        modules: {
          toolbar: {
            container: [
              "bold",
              "italic",
              "underline",
              "blockquote",
              "code-block",
              { list: "ordered" },
              { list: "bullet" },
              { header: [1, 2, 3, 4, 5, 6, false] },
              { align: [] },
              "image",
            ],
            handlers: {
              image: (value) => {
                if (value) {
                  document.getElementById("fileBtn").click();
                } else {
                  this.quill.format("image", true);
                }
              },
            },
          },
        },
        theme: "snow",
      },
      quill: null,
    };
  },
  components: {
    QuillEditor,
  },
  methods: {
    clearcon() {
      this.category = "";
      this.quill.setContents("");
    },
    checkArticles() {
      let conlen = this.content.replace(/<.*?>/g, "").length;
      if (conlen < 30 || conlen > 1000) {
        ElMessage.error("文章内容长度介于30~3000之间");
        return false;
      }
      return true;
    },
    fetchData() {
      // 根据选择的分类从后端获取数据
      axios
        .get(`http://127.0.0.1:5000/get_profiles?category=${this.category}`)
        .then((response) => {
          // 将获取的数据赋值给 content
          this.content = response.data.data;
        });
    },
    uparticle() {
      if (this.checkArticles()) {
        let data = {
          con: this.content,
        };
        axios
          .post(
            `http://127.0.0.1:5000/saveprofile?category=${this.category}`,
            this.qs.stringify(data)
          )
          .then((res) => {
            if (res.data.res == "ok") {
              ElMessage({
                message: "文章更新成功",
                type: "success",
              });
            } else {
              ElMessage.error("程序出错");
            }
          });
      }
    },
    handleUpload(event) {
      //获取文件
      let file = event.target.files[0];

      // 判断文件是否存在
      if (!file) {
        return; // 如果没有选择文件，直接返回，不继续执行后续代码
      }
      let type = ["image/jpeg", "image/jpg", "image/png"];
      let isJPG = type.includes(file.type);
      let isLt10M = file.size / 1024 / 1024 < 10;

      //图片格式
      if (!isJPG) {
        ElMessage.error("图片格式错误");
        return;
      }
      //图片大小
      if (!isLt10M) {
        ElMessage.error("上传图片不能超过10M");
        return;
      }

      let params = new FormData();
      params.append("file", file);

      axios
        .post(
          "http://127.0.0.1:5000/upprofile",
          params,
          (Headers = { "Content-Type": "multipart/form-data" })
        )
        .then((res) => {
          if (res.data.picname != "error") {
            let picname = res.data.picname;

            let pic_url = "/imgs/honour/" + picname;

            let con = this.quill.getHTML() + '<img src="' + pic_url + '">';
            this.quill.setHTML(con);
          }
        });
    },
  },
  mounted() {
    // 获取QuillEditor组件实例并赋值给this.quill
    this.quill = this.$refs.QuillEditor;
  },
};
</script>

<style scoped>
.title-input {
  width: 300px;
}

.quill-editor {
  height: 500px;
}

.gettime {
  margin-left: 10px;
}
</style>
