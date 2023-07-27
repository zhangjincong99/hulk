<template>
  <div class="news-details">
    <h2 class="news-title">{{ news.title }}</h2>
    <p class="news-time">时间:{{ news.time }}</p>
    <p class="news-author">作者: {{ news.author }}</p>
    <article
      ref="newsContent"
      class="news-content"
      v-html="processedContent"
    ></article>
  </div>
</template>

<script>
export default {
  data() {
    return {
      news: {
        title: "",
        time: "",
        author: "",
        content: "",
      },
      processedContent: "",
    };
  },
  created() {
    this.processNewsContent();
  },
  methods: {
    async processNewsContent() {
      this.news.title = this.$route.query.title || "";
      this.news.time = this.$route.query.time || "";
      this.news.author = this.$route.query.author || "";
      this.news.content = this.$route.query.content || "";

      this.processedContent = this.renderContentWithImages(this.news.content);
    },
    renderContentWithImages(content) {
      const imgRegex = /<img[^>]+src="([^">]+)"/g;
      const processedContent = content.replace(imgRegex, (match, src) => {
        return `<img class="news-image" src="${src}" ref="newsImage" style="max-width: 100%; max-height: 100%; display: block; margin:0 auto;"`;
      });

      const paragraphs = processedContent.split("<p>");
      let processedParagraphs = [];

      for (let i = 0; i < paragraphs.length; i++) {
        const paragraph = paragraphs[i];
        if (paragraph.trim() !== "") {
          const hasImage = paragraph.includes("<img");
          const indentStyle = hasImage ? "" : 'style="text-indent: 2em"';
          const processedParagraph = `<p ${indentStyle}>${paragraph.trim()}</p>`;
          processedParagraphs.push(processedParagraph);
        }
      }

      return processedParagraphs.join("\n");
    },
  },
};
</script>

<style scoped>
.news-details {
  max-width: 960px;
  margin: 0 auto;
  padding: 40px 20px;
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.news-title {
  font-size: 24px;
  font-weight: bold;
  margin-top: 0;
  margin-bottom: 10px;
}

.news-author {
  font-size: 14px;
  color: #999;
  margin-top: 0;
  margin-bottom: 20px;
}

.news-time {
  font-size: 14px;
  color: #999;
  margin-top: 5px;
  margin-bottom: 5px;
}

.news-content {
  font-weight: 400;
  line-height: 2;
  margin-bottom: 20px;
  word-break: break-word;
  position: relative;
  text-align: left;
}
</style>
