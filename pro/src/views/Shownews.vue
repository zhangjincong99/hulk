<template>
  <div class="news-details">
    <h2 class="news-title">{{ $route.query.title }}</h2>
    <p class="news-time">时间:{{ $route.query.time }}</p>
    <p class="news-author">作者: {{ $route.query.author }}</p>
    <article
      class="news-content"
      v-html="renderContentWithImages($route.query.content)"
    ></article>
  </div>
</template>

<script>
export default {
  mounted() {
    // 可以在这里处理新闻内容的样式或其他操作
  },
  methods: {
    renderContentWithImages(content) {
      const imgRegex = /<img[^>]+src="([^">]+)"/g;
      const processedContent = content.replace(
        imgRegex,
        '<img class="news-image" src="$1" style="max-width: 100%; max-height: 100%;"'
      );

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
