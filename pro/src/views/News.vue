<template>
  <HeadercomVue></HeadercomVue>
  <div class="app-container">
    <div class="contact-divider">
      <div id="evMo_qA0mS">
        <hr class="ev-line ev-line-10" />
      </div>
      <div class="ev-module-edit">
        <h3>
          <span>
            <strong>新闻公告</strong>
          </span>
        </h3>
      </div>
    </div>
    <section class="news-announcement">
      <div class="container">
        <table class="news-table">
          <thead>
            <tr>
              <th>标题</th>
              <th>发布时间</th>
              <th>作者</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="newsItem in displayedNews"
              :key="newsItem.id"
              @click="
                showNewsContent(
                  newsItem.id,
                  newsItem.title,
                  newsItem.author,
                  newsItem.time,
                  newsItem.content
                )
              "
            >
              <td>{{ newsItem.title }}</td>
              <td>{{ newsItem.time }}</td>
              <td>{{ newsItem.author }}</td>
            </tr>
          </tbody>
        </table>
        <div v-if="showMoreButton" class="load-more">
          <button @click="showMore">查看更多</button>
        </div>
      </div>
    </section>
  </div>
  <FootercomVue></FootercomVue>
</template>

<script>
import FootercomVue from "@/components/Footercom.vue";
import HeadercomVue from "@/components/Headercom.vue";
import axios from "axios";

export default {
  components: {
    FootercomVue,
    HeadercomVue,
  },
  data() {
    return {
      news: [],
      displayedNews: [],
      batchSize: 20,
      showMoreButton: true,
    };
  },
  mounted() {
    this.fetchNews();
  },
  methods: {
    async fetchNews() {
      try {
        const response = await axios.get("http://127.0.0.1:5000/getnews");
        const newsData = response.data;
        this.news = newsData.map((item) => ({
          id: item.nid,
          title: item.title,
          time: item.time,
          content: item.content,
          author: item.author,
        }));

        this.displayedNews = this.news.slice(0, this.batchSize);
      } catch (error) {
        console.error("Failed to fetch news:", error);
      }
    },
    showMore() {
      const currentBatchSize = this.displayedNews.length;
      const nextBatchSize = currentBatchSize + this.batchSize;
      if (nextBatchSize >= this.news.length) {
        this.showMoreButton = false;
      }
      this.displayedNews = this.news.slice(0, nextBatchSize);
    },
    showNewsContent(id, title, author, time, content) {
      // 通过路由切换到新闻详情页，并传递新闻信息作为参数
      this.$router.push({
        path: `/news/${id}`,
        query: {
          title: title,
          time: time,
          content: content,
          author: author ? author : "",
        },
      });
    },
  },
};
</script>

<style scoped>
/* .app-container {
  background-color: #f5f5f5;
} */

.news-announcement {
  padding: 40px 0;
  /* background-color: #f5f5f5; */
}

.container {
  max-width: 960px;
  margin: 0 auto;
  padding: 0 20px;
  /* background-color: white; */
}

.section-title {
  text-align: center;
  font-size: 24px;
  margin-bottom: 20px;
}

.news-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
  padding-top: 20px;
  text-align: center; /* 将表格居中显示 */
}

.news-table th,
.news-table td {
  border: 1px solid #ccc;
  padding: 8px;
}

.news-table th {
  background-color: #f5f5f5;
  font-weight: bold;
}

.load-more {
  text-align: center;
  margin-top: 20px;
}

.contact-divider {
  display: flex;
  align-items: center;
  margin-top: 20px;
}

#evMo_qA0mS {
  margin-right: 20px;
}

.ev-line {
  margin-left: 255px;
  height: 40px;
  border-left: 5px solid rgb(33, 192, 75);
}

.ev-module-edit {
  display: flex;
  align-items: center;
  margin-left: 20px;
}

.ev-module-edit h3 {
  text-align: left;
  font-size: 24px;
  margin-bottom: 0;
  margin-top: 0;
}

.load-more button {
  background-color: #009966;
  color: white;
  padding: 10px 20px;
  border-radius: 4px;
  border: none;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.load-more button:hover {
  background-color: #007755;
}
</style>
