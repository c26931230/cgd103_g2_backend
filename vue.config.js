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
				target: 'http://localhost/cgd103_g2_backend/phpfile',
				changeOrigin: true,
				pathRewrite: {
					'^/api_server': ''
				}
			}
		}
	},
	productionSourceMap: false
})
