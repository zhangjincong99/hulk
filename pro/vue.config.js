module.exports = {
  publicPath: '/', // 设置公共路径，如果项目在根目录下，可以设置为 '/'
  outputDir: 'dist', // 设置打包输出目录为 dist 文件夹
  assetsDir: 'static',
  parallel: false,

  devServer: {
    proxy: {
      '/api': {
        target: 'http://127.0.0.1:5000', // 设置代理目标为 Flask 后端的地址
        ws: true,
        changeOrigin: true
      }
    }
  }
}