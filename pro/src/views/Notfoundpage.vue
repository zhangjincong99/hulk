<template>
  <div class="home">
    <div class="container notfoundindex clearfix">
      <img src="@/assets/404/404.png" alt="" />
      <div id="backindex"><a href="/">返回首页</a></div>
    </div>
  </div>
</template>
  
  <script>
export default {
  name: "notfoundpage",
  data() {
    return {};
  },
};
</script>
  
  <style>
a,
body {
  color: #333;
}

.notfoundindex {
  margin-top: 150px;
  height: 600px;
}

#backindex {
  width: 200px;
  margin: 0px auto;
}

#backindex a {
  color: #ccc;
}
</style>