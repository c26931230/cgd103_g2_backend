<template>
	<div class="back_end_member">
		<h2>會員管理</h2>
		<!-- 上方篩選區 -->
		<div class="filter_box">
			<input type="text" placeholder="Search" />
			<button class="icon_box">search</button>
		</div>
		<!-- 上方篩選區 end -->
		<!-- 會員列表 -->
		<table class="table member_table">
			<thead>
			<tr>
				<th scope="col">編號</th>
				<th scope="col">姓名</th>
				<th scope="col">訂閱</th>
				<th scope="col">信箱</th>
				<th scope="col">電話</th>
				<th scope="col">風格</th>
				<th scope="col">身形</th>
			</tr>
			</thead>
			<tbody>
			<tr v-for="member in members" class="item" :key="member.id" @click="showLightbox(member)">
				<th scope="row">{{ member.id }}</th>
				<!-- 編號 -->
				<td>{{ member.name }}</td>
				<!-- 姓名 -->
				<td>{{ member.subscribe }}</td>
				<!-- 訂閱 -->
				<td>{{ member.mail }}</td>
				<!-- 信箱 -->
				<td>{{ member.tel }}</td>
				<!-- 電話 -->
				<td>{{ member.style }}</td>
				<!-- 風格 -->
				<td>{{ member.type }}</td>
				<!-- 身形 -->
			</tr>
			</tbody>
		</table>
		<!-- 會員列表 end -->

		<!-- 頁碼 -->
		<nav aria-label="...">
			<ul class="pagination">
				<li class="page-item disabled">
					<span class="page-link">Previous</span>
				</li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item active" aria-current="page">
					<span class="page-link">2</span>
				</li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item">
				<a class="page-link" href="#">Next</a>
				</li>
			</ul>
		</nav>
		<!-- 頁碼 end -->
	</div>
	
	<!-- 顯示燈箱 -->
    <div v-if="lightboxVisible" class="lightbox">
		<!-- 顯示訂單詳細資料 -->
		<!-- <h2>{{ currentOrder.id }} - {{ currentOrder.customer }}</h2>
		<p>Date: {{ currentOrder.date }}</p>
		<p>Total: {{ currentOrder.total }}</p>
		<p>Status: {{ currentOrder.status }}</p> -->
		<button @click="closeLightbox">Close</button>
	</div>

</template>
<script>
	export default {
		name: "MemberMgmt",
		data() {
			return {
				members: [
				//會員資訊
				// {
				//     id: 1,
				//     name: "Mandy",
				//     subscribe: "Basic",
				//     mail:"c123123@gmail.com",
				//     tel:"0912312312",
				//     style:"極簡",
				//     type: "沙漏",
				// },
				// {
				//     id: 2,
				//     name: "Mandy",
				//     subscribe: "Basic",
				//     mail:"c123123@gmail.com",
				//     tel:"0912312312",
				//     style:"極簡",
				//     type: "沙漏",
				// },
				],
				currentMember: {},
				lightboxVisible: false,
			};
		},
		methods: {
			showLightbox(member) {
			this.currentMember = member;
			this.lightboxVisible = true;
			},
			closeLightbox() {
			this.lightboxVisible = false;
			},
		},
		mounted(){
			// Axios.js
			axios.get("/api_server/member.php").then(res => console.log(res))
			// axios.get('../XML_JSON_CSV/bookData.json').then(res => console.log(res.data))
			// axios.get('../XML_JSON_CSV/bookData.json').then(res => this.books = res.data)
		},

	};
</script>
<style lang="scss" scoped>
.back_end_member {
	box-sizing: border-box;
	// 會員列表-上方篩選區
	.filter_box {
		display: flex;
		align-items: stretch;
	}
	button {
		min-width: 70px;
		outline: none;
		border: none;
		background-color: $main_color;
		color: #fff;
		height: 45px;
		padding: 0px 10px;
	}
	input {
		outline: none;
		border: 1px $main_color solid;
	}
	h2 {
		font-weight: 600;
		color: $main_color;
		margin: 10px 0;
	}
	// 會員列表
	.member_table {
		background-color: #fff;
		border-radius: 10px;
		overflow: hidden;
		margin-top: 50px;
		.filter_box select,
		.filter_box button {
			margin: 0 5px;
		}
		thead {
			background-color: $main_color;
			color: #fff;
			tr {
				th {
					font-weight: 600; // 表頭
				}
			}
		}
		tbody {
			.item {
				cursor: pointer;
			}
		}
	}
}
.lightbox { // 燈箱
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
}

</style>