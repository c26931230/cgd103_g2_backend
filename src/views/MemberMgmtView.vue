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
                    <th scope="col">最後訂閱時間</th>
                    <th scope="col">信箱</th>
                    <th scope="col">電話</th>
                    <th scope="col">風格</th>
                    <th scope="col">身形</th>
                </tr>
            </thead>

            <tbody>
                <tr
                    v-for="(e, i) in members"
                    class="item"
                    :key="i"
                    @click="showLightbox(e[0])"
                >
                    <th scope="row">{{ e[0].mem_id }}</th>
                    <!-- 編號 -->
                    <td>{{ e[0].mem_name }}</td>
                    <!-- 姓名 -->
                    <td>{{ e[0].sub_time }}</td>
                    <!-- 訂閱 -->
                    <td>{{ e[0].mem_mail }}</td>
                    <!-- 信箱 -->
                    <td>{{ e[0].phone }}</td>
                    <!-- 電話 -->
                    <td>{{ e[0].style_name }}</td>
                    <!-- 風格 -->
                    <td>{{ e[0].body_shape }}</td>
                </tr>
            </tbody>
        </table>
        <!-- 會員列表 end -->

        <!-- 頁碼 -->
        <Memlightbox
            :data="data"
            v-if="lightboxVisible"
            @close="lightboxVisible = false"
        ></Memlightbox>
        <!-- <nav aria-label="..."> -->
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
        <!-- 頁碼 end -->
    </div>
</template>
<script>
import Memlightbox from "@/components/Memlightbox.vue";
//引入BASE_URL參數
import { BASE_URL } from "@/assets/js/common.js";
export default {
    name: "MemberMgmt",
    components: { Memlightbox },
    data() {
        return {
            data: {},
            tmp: [],
            members: [],
            currentMember: {},
            lightboxVisible: false,
            index: 103,
        };
    },
    methods: {
        showLightbox(e) {
            this.data = e;
            this.lightboxVisible = true;
        },
        closeLightbox() {
            this.lightboxVisible = false;
        },
    },
    mounted() {
        this.axios.get(`${BASE_URL}/member.php`).then((res) => {
            this.tmp = res.data;

            const groupBy = (array, key) =>
                array.reduce((objectsByKeyValue, obj) => {
                    const value = obj[key];
                    objectsByKeyValue[value] = (
                        objectsByKeyValue[value] || []
                    ).concat(obj);
                    return objectsByKeyValue;
                }, {});

            this.members = groupBy(this.tmp, "mem_id");
        });
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
.lightbox {
    // 燈箱
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