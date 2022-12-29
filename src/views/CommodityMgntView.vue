<template>
    <div class="back_end_shop">
        <!-- 新增編輯商品燈箱區 -->
        <AddNew v-if="Add" @close="Add = false"></AddNew>
        <!-- 產品彈窗 -->
        <ProductChange
            :product="getdetail(detail_id)"
            v-if="x"
            @closeChangeBox="update"
        ></ProductChange>
        <h2>商品管理</h2>
        <!-- 上方篩選區 -->

        <div class="filter_box">
            <div>
                <h6>種類</h6>
                <SelectType
                    v-model:selected1="qgender"
                    v-model:selected2="qmaintype"
                    v-model:selected3="qtype"
                ></SelectType>
            </div>
            <div>
                <h6>關鍵字</h6>
                <Searchinput v-model:search="qsearch"></Searchinput>
            </div>
            <button class="btn_s" @click="search">search</button>
            <button class="btn_l" @click="reset">reset</button>
            <button class="main" id="create" @click="open()">新增</button>
        </div>
        <!-- 上方篩選區 end -->
        <!-- 商品列表 -->
        <!-- {{ qgender }}{{ qmaintype }}{{ qtype }}{{ qsearch }} -->
        <table class="table shop_table align-middle">
            <thead>
                <tr>
                    <th scope="col">編號</th>
                    <th scope="col">商品圖</th>
                    <th scope="col">品名</th>
                    <th scope="col">男女</th>
                    <th scope="col">種類</th>
                    <th scope="col">分類</th>
                    <th scope="col" class="col-1">顏色</th>
                    <th scope="col" class="col-1">尺寸 / #Hashtag</th>
                    <th scope="col">售價</th>
                    <th scope="col">狀態</th>
                    <th scope="col" class="col-2">描述</th>
                </tr>
            </thead>
            <tbody>
                <tr
                    v-for="item in product"
                    class="item"
                    :key="item.product_id"
                    @click="openChangeBox(item.product_id)"
                >
                    <th scope="row">{{ item.product_id }}</th>
                    <!-- 編號 -->
                    <td class="product_img">
                        <img
                            :src="`https://tibamef2e.com/cgd103/g2/front/pic/${cut(
                                item.product_pic
                            )}`"
                            :alt="item.product_name"
                        />
                    </td>
                    <!-- 商品圖 -->
                    <td>
                        <div>
                            <p>{{ item.product_name }}</p>
                        </div>
                        <div class="product_img_min d-flex">
                            <img
                                v-for="(e, i) in split(item.product_pic)"
                                :key="i"
                                :src="`https://tibamef2e.com/cgd103/g2/front/pic/${e}`"
                                :alt="item.product_name"
                            />
                        </div>
                    </td>
                    <!-- 品名 -->
                    <td>{{ gender(item.product_gender) }}</td>
                    <td>{{ item.product_maintype }}</td>
                    <td>{{ item.product_type }}</td>
                    <!-- 類型 -->
                    <td>
                        <div class="d-flex">
                            <div>
                                <div
                                    v-for="i in split(item.product_color)"
                                    :key="i"
                                    class="circle m-1"
                                    :style="{ backgroundColor: i }"
                                ></div>
                            </div>
                            <div>
                                <div
                                    v-for="(e, i) in split(
                                        item.product_color_name
                                    )"
                                    :key="i"
                                    class="m-1"
                                >
                                    {{ e }}
                                </div>
                            </div>
                        </div>
                    </td>
                    <!-- 顏色 -->
                    <td>
                        <div class="d-flex align-items-center mb-1">
                            <div
                                v-for="i in split(item.product_size)"
                                :key="i"
                                class="border border-dark mx-1 px-1"
                            >
                                {{ i }}
                            </div>
                        </div>
                        <!-- 尺寸 -->
                        <div class="d-flex align-items-center">
                            <div
                                v-for="i in split(item.hashtag)"
                                :key="i"
                                class="border border-dark mx-1 px-1"
                            >
                                {{ i }}
                            </div>
                        </div>
                    </td>
                    <td>{{ item.unit_price }}</td>
                    <!-- 價格 -->
                    <td>{{ state(item.product_state) }}</td>
                    <!-- 狀態 -->
                    <td>{{ item.product_text }}</td>
                    <!-- hashtag -->
                </tr>
            </tbody>
        </table>
    </div>
</template>
<script>
import { BASE_URL } from "@/assets/js/common.js";

import ProductChange from "@/components/product/ProductChange.vue";
import Searchinput from "@/components/product/Searchinput.vue";
import SelectType from "@/components/product/SelectType.vue";
import AddNew from "@/components/product/AddNew.vue";
export default {
    components: { SelectType, AddNew, Searchinput, ProductChange },
    name: "CommodityMgnt",
    data() {
        return {
            x: false,
            detail_id: 0,
            qgender: "",
            qmaintype: "",
            qtype: "",
            qsearch: "",
            Add: false,
            tag_name: "", //hashtag
            tags: [], //hashtag 陣列
            tmp: [],
            product: [],
            change: false,
        };
    },
    watch: {
        qgender: function () {
            this.qmaintype = this.qtype = "";
        },
        qmaintype: function () {
            this.qtype = "";
        },
        address: function () {
            console.log(this.address);
            if (JSON.stringify(this.address) !== "{}") {
                let result = this.tmp;
                if (this.$route.query.G !== "") {
                    result = result.filter((e) => {
                        return e.product_gender == this.$route.query.G;
                    });
                }
                if (this.$route.query.M !== "") {
                    result = result.filter((e) => {
                        return e.product_maintype == this.$route.query.M;
                    });
                }
                if (this.$route.query.T !== "") {
                    result = result.filter((e) => {
                        return e.product_type == this.$route.query.T;
                    });
                }
                if (this.$route.query.S !== "") {
                    result = result.filter((e) => {
                        console.log(JSON.stringify(e));

                        if (
                            JSON.stringify(e).indexOf(this.$route.query.S) !==
                            -1
                        )
                            return e;
                    });
                }
                this.product = result;
            }
        },
    },
    computed: {
        address() {
            return this.$route.query;
        },
    },
    methods: {
        update() {
            this.x = false;
            this.getResource;
        },

        state(x) {
            return x == 1 ? "上架" : "下架";
        },
        getdetail(x) {
            return this.product.find((e) => e.product_id === x);
        },
        openChangeBox(X) {
            this.x = true;
            this.detail_id = X;
        },
        search() {
            this.$router.push({
                path: `/CommodityMgnt`,
                query: {
                    G: this.qgender,
                    M: this.qmaintype,
                    T: this.qtype,
                    S: this.qsearch,
                },
            });
        },
        gender(x) {
            if (x == 1) return "男";
            else return "女";
        },
        cut(x) {
            if (x) return x.split(",")[0];
        },
        split(x) {
            if (x) return x.split(",");
        },
        open() {
            this.Add = true;
        },
        close() {
            //關燈箱
            this.Add = false;
        },
        add_sub_item() {
            $("#wrap").append(`
         		`);
        },
        addTo() {
            this.tags.push(this.tag_name);
            this.tag_name = "";
        },
        removeTo(index) {
            this.tags.splice(index, 1);
        },
        getResource() {
            const URL = `${BASE_URL}/mainproduct.php`;
            fetch(URL)
                .then((res) => res.json())
                .then((json) => {
                    this.tmp = this.product = json;
                });
        },
        reset() {
            this.$router.replace("/CommodityMgnt");
            this.qgender = this.qmaintype = this.qtype = this.qsearch = "";
            this.product = this.tmp;
        },
    },
    created() {
        this.getResource();
    },
};
</script>
<style lang="scss" scroped>
$main_color: #495bff;

.back_end_shop {
    box-sizing: border-box;
    select {
        width: 80px;
        font-size: 16px;
        border: 1px $main_color solid;
        height: 45px;
    }
    button.main {
        min-width: 70px;
        outline: none;
        border: none;
        background-color: $main_color;
        color: #fff;
        height: 45px;
        padding: 0px 10px;
    }

    input:not(input[type="file"]) {
        outline: none;
        border: 1px $main_color solid;
    }

    .wrap {
        .sub_form_item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 10px;

            label {
                width: 100px;
                font-size: 20px;
                font-weight: 900;
                color: $main_color;
                line-height: 45px;
            }

            .option {
                // 子項目
                position: relative;
                display: flex;
                justify-content: space-between;
                width: 100%;

                input:nth-child(1) {
                    // 檔案
                    width: 200px;
                    padding: 5px 0;
                }

                input:nth-child(2) {
                    // 顏色
                    width: 80px;
                    font-size: 16px;
                    outline: none;
                    height: 45px;
                    border: 1px $main_color solid;
                }
            }
        }
    }

    .confirm_box {
        margin-top: 20px;
        text-align: center;

        button {
            margin: 0 5px;
        }
    }

    // 商品列表-上方篩選區
    .filter_box {
        display: flex;
        align-items: flex-end;
        position: relative;
        input,
        select,
        button {
            margin: 0 5px 0 0;
        }

        #create {
            margin-left: auto;
        }

        .search {
            margin: 0;
        }
    }

    h2 {
        font-weight: 600;
        color: $main_color;
        margin: 10px 0;
    }

    // 商品列表
    .shop_table {
        background-color: #fff;
        border-radius: 10px;
        overflow: hidden;
        margin-top: 50px;

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

                .product_img {
                    img {
                        width: 100px; // 商品圖
                        height: 100px; // 商品圖
                        object-fit: contain;
                    }
                }
                .product_img_min {
                    img {
                        width: 30px;
                        height: 30px;
                        object-fit: contain;
                    }
                }
            }
        }
    }
}
.circle {
    aspect-ratio: 1 /1;
    border-radius: 50%;

    border: 2px solid rgba(33, 30, 30, 0.582);
    width: 24px;
}
</style>
