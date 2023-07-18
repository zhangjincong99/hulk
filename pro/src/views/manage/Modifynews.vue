<template>
  <div>
    <el-form label-width="120px">
      <el-form-item label="文章标题：">
        <el-input
          type="text"
          autocomplete="off"
          v-model="title"
          class="title-input"
        />
      </el-form-item>
      <el-form-item label="文章作者：">
        <el-input
          type="text"
          autocomplete="off"
          v-model="author"
          class="title-input"
        />
      </el-form-item>
      <el-form-item label="发布时间：">
        <el-input
          type="text"
          autocomplete="off"
          v-model="time"
          class="title-input"
        />
      </el-form-item>
      <el-form-item label="文章内容：" class="content-item">
        <div class="file-upload">
          <input
            type="file"
            hidden
            id="fileBtn"
            @change="handleUpload($event)"
          />

          <QuillEditor
            :options="options"
            style="height: 400px; width: 505px"
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
      title: "",
      author: "",
      time: "",
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
              image: function (value) {
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
      this.title = "";
      this.quill.setContents("");
    },
    checkArticles() {
      this.content = this.quill.getContents();
      if (!this.title.trim()) {
        ElMessage.error("标题不能为空");
        return false;
      }
      if (!this.author.trim()) {
        ElMessage.error("作者不能为空");
        return false;
      }
      if (!this.time.trim()) {
        ElMessage.error("时间不能为空");
        return false;
      }
      if (this.title.trim().length < 4 || this.title.trim().length > 20) {
        ElMessage.error("标题的长度介于4~20之间");
        return;
      }
      let conlen = this.content.replace(/<.*?>/g, "").length;
      if (conlen < 30 || conlen > 1000) {
        ElMessage.error("文章内容长度介于30~1000之间");
        return false;
      }
      return true;
    },
    uparticle() {
      if (this.checkArticles()) {
        let data = {
          aid: this.aid,
          title: this.title.trim(),
          time: this.time,
          author: this.author.trim(),
          con: this.content,
        };
        axios
          .post("http://127.0.0.1:5000/uparticle", this.qs.stringify(data))
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
      let type = ["image/jpeg", "image/jpg", "image/png"];
      let isJPG = type.includes(file.type);
      let isLt2M = file.size / 1024 / 1024 < 2;

      //图片格式
      if (!isJPG) {
        ElMessage.error("图片格式错误");
        return;
      }
      //图片大小
      if (!isLt2M) {
        ElMessage.error("上传图片不能超过2M");
        return;
      }

      let params = new FormData();
      params.append("file", file);

      axios
        .post(
          "http://127.0.0.1:5000/uparticlepic",
          params,
          (Headers = { "Content-Type": "multipart/form-data" })
        )
        .then((res) => {
          if (res.data.picname != "error") {
            let picname = res.data.picname;

            let pic_url = "/imgs/news/" + picname;

            let con = this.quill.getHTML() + '<img src="' + pic_url + '">';
            this.quill.setHTML(con);
          }
        });
    },
  },
  computed: {},
  mounted() {
    this.quill = this.$refs.QuillEditor;
    this.aid = this.$route.params.aid;
    console.log(this.aid);
    if (this.aid > 0) {
      this.axios
        .get("http://127.0.0.1:5000/getmyarticle?aid=" + this.aid)
        .then((res) => {
          if (res.data.res == "no") {
            this.$router.push("/404");
          } else {
            this.title = res.data.res[0].title;
            this.author = res.data.res[0].author;
            this.time = res.data.res[0].time;
            this.quill.setHTML(res.data.res[0].con);
          }
        });
    }
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
</style>

