const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
	transpileDependencies: true,
	css: {
		loaderOptions: {
			scss: {
				additionalData: `@import "@/assets/sass/main.scss";`,
			},
		},
	},
	publicPath: process.env.NODE_ENV === 'production'
		? '/cgd103/g2/back/'
		: '/',
	devServer: {
		proxy: {
			'/api_server': {
				target: 'http://localhost/cgd103_g2_backend/phpfile',//本地
				// target: 'https://tibamef2e.com/cgd103/g2/back/phpfile',//上線
				changeOrigin: true,
				pathRewrite: {
					'^/api_server': ''
				}
			}
		}
	},
	productionSourceMap: false,
	filenameHashing: false
})
