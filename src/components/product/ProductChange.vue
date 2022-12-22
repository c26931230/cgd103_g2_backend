<template>
    <div>
        <div id="edit_boxOutside" @click="close()"></div>

        <div id="edit_box">
            <div class="form_item">
                <div class="label" for="title">品名</div>
                <div>
                    <input
                        class="form-control"
                        type="text"
                        id="title"
                        v-model="add.product_name"
                        maxlength="10"
                    />
                </div>
            </div>
            <div class="form_item">
                <div class="label" for="price">售價</div>
                <div>
                    <input
                        class="form-control"
                        type="number"
                        id="price"
                        v-model="add.unit_price"
                        min="1"
                        max="1000000"
                    />
                </div>
            </div>
            <div class="form_item">
                <div class="label" for="state">上架狀態</div>
                <div>
                    <select name="" id="state" v-model="add.product_state">
                        <option value="0">下架</option>
                        <option value="1">上架</option>
                    </select>
                </div>
            </div>
            <div class="form_item">
                <div class="label" for="">分類</div>
                <SelectType
                    v-model:selected1="add.product_gender"
                    v-model:selected2="add.product_maintype"
                    v-model:selected3="add.product_type"
                ></SelectType>
            </div>
            <!-- 風格 -->
            <div class="form_item">
                <div class="label" for="style">風格</div>
                <div class="d-flex me-1">
                    <div class="input-group mb-3 me-1">
                        <div class="input-group-text">
                            <input
                                class="form-check-input mt-0"
                                type="checkbox"
                                value="極簡風"
                                aria-label="Checkbox for following text input"
                                v-model="style_type"
                            />極簡風
                        </div>
                    </div>
                    <div class="input-group mb-3 me-1">
                        <div class="input-group-text">
                            <input
                                class="form-check-input mt-0"
                                type="checkbox"
                                value="文青風"
                                aria-label="Checkbox for following text input"
                                v-model="style_type"
                            />文青風
                        </div>
                    </div>
                    <div class="input-group mb-3 me-1">
                        <div class="input-group-text">
                            <input
                                class="form-check-input mt-0"
                                type="checkbox"
                                value="休閒風"
                                aria-label="Checkbox for following text input"
                                v-model="style_type"
                            />休閒風
                        </div>
                    </div>
                    <div class="input-group mb-3 me-1">
                        <div class="input-group-text">
                            <input
                                class="form-check-input mt-0"
                                type="checkbox"
                                value="時尚風"
                                aria-label="Checkbox for following text input"
                                v-model="style_type"
                            />時尚風
                        </div>
                    </div>
                </div>
            </div>
            <!-- 身形 -->
            <div class="form_item">
                <div class="label" for="body">身形</div>
                <div>
                    <select name="" id="body" v-model="add.body_type">
                        <option value="梨型">梨型</option>
                        <option value="蘋果型">蘋果型</option>
                        <option value="矩形">矩形</option>
                        <option value="沙漏型">沙漏型</option>
                        <option value="倒三角型">倒三角型</option>
                    </select>
                </div>
            </div>
            <!-- 尺寸 -->

            <div class="form_item">
                <div class="label" for="size">尺寸</div>
                <div>
                    <div class="d-flex justify-content-start">
                        <div
                            class="input-group mb-1 me-1"
                            :for="e"
                            v-for="e in arrSize"
                            :key="e"
                        >
                            <div class="input-group-text">
                                <input
                                    class="form-check-input mt-0"
                                    type="checkbox"
                                    :value="e"
                                    aria-label="Checkbox for following text input"
                                    v-model="product_size"
                                />{{ e }}
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-start">
                        <div
                            class="input-group-text mb-1 me-1"
                            :for="e"
                            v-for="e in arrshoseSize"
                            :key="e"
                        >
                            <input
                                class="form-check-input mt-0"
                                type="checkbox"
                                :value="e"
                                aria-label="Checkbox for following text input"
                                v-model="product_size"
                            />{{ e }}
                        </div>
                    </div>
                </div>
            </div>
            <!-- 圖片 -->
            <div class="form_item">
                <div class="label">圖片</div>
                <div>
                    <div
                        class="mulpic d-flex"
                        v-for="(item, index) in pic"
                        :key="index"
                    >
                        <div class="imgBox">
                            <img
                                v-if="item.value != ''"
                                :src="require(`@/assets/product/${item.value}`)"
                            />
                        </div>
                        <div><button class="btn_s">更換圖片</button></div>
                        <input
                            type="file"
                            class="file"
                            @change="onFileChange(index, $event)"
                        />
                        <button @click="removeInput(index)">-</button>
                    </div>
                </div>
                <button @click="addInput" v-show="pic.length < 4">+</button>
            </div>
            <!-- 顏色 -->
            <div class="form_item">
                <div class="label">顏色</div>
                <div>
                    <div class="d-flex my-1" v-for="(e, i) in color" :key="i">
                        <input type="color" v-model="e.value" />
                        <button @click="removeInputColor">-</button>
                    </div>
                    <button @click="addInputColor">+</button>
                </div>
                <div class="btn_box"></div>
            </div>
            <!-- hashtag -->
            <div class="form_item">
                <div class="label">hashtag</div>
                <div>
                    <div class="d-flex my-1" v-for="(e, i) in hashtag" :key="i">
                        <input v-model="e.value" class="form-control" />
                        <button @click="removeInputTag">-</button>
                    </div>
                    <button @click="addInputTag">+</button>
                </div>
            </div>

            <div class="confirm_box">
                <button class="main" @click="addProduct()">修改</button>
                <button class="main" id="cancel" @click="close()">取消</button>
            </div>
        </div>
    </div>
</template>
<script>
import SelectType from "@/components/product/SelectType.vue";
export default {
    components: { SelectType },
    props: {
        product: Object,
    },
    emits: ["closeChangeBox"],
    data() {
        return {
            arrSize: ["XS", "S", "M", "L", "XL", "F"],
            arrshoseSize: [25, 26, 27, 28, 29, 30, 31],
            type: {},
            add: {},
            pic: {},
            hashtag: {},
            color: {},
            style_type: [],
            product_size: [],
        };
    },
    computed: {},
    methods: {
        getpic() {
            return this.add.product_pic.split(",").map((value) => ({ value }));
        },
        gethashtag() {
            return this.add.hashtag.split(",").map((value) => ({ value }));
        },
        getcolor() {
            return this.add.product_color
                .split(",")
                .map((value) => ({ value }));
        },
        getstyle_type() {
            return this.add.style_type.split(",");
        },
        getproduct_size() {
            return this.add.product_size.split(",");
        },
        close() {
            this.$emit("closeChangeBox");
        },
        addProduct() {
            this.add.unit_price = this.add.unit_price.toString();
            this.add.style_type = this.style_type.join(",");
            this.add.product_pic = this.pic.map((item) => item.value).join(",");
            this.add.hashtag = this.hashtag.map((item) => item.value).join(",");
            this.add.product_color = this.color
                .map((item) => item.value)
                .join(",");
            this.add.product_size = this.product_size.join(",");

            console.log(JSON.parse(JSON.stringify(this.add)));

            fetch("api_server/prod_change.php", {
                method: "post",
                body: JSON.stringify(this.add),
            })
                .then((response) => response.json())
                .then((data) => {
                    // 在這裡處理服務器返回的數據
                    if (data.msg) {
                        alert(data.msg);
                    }
                });
            this.close();
        },

        onFileChange(index, event) {
            const files = event.target.files;
            if (files && files.length > 0) {
                console.log(files);

                console.log(files[0].name);

                this.pic[index].value = files[0].name;
            }
        },
        addInput() {
            this.pic.push({ value: "" });
        },
        removeInput(index) {
            this.pic.splice(index, 1);
        },
        addInputTag() {
            this.hashtag.push({ value: "" });
        },
        removeInputTag(index) {
            this.hashtag.splice(index, 1);
        },
        addInputColor() {
            this.color.push({ value: "" });
        },
        removeInputColor(index) {
            this.color.splice(index, 1);
        },
    },
    created() {
        this.add = this.product;
        this.pic = this.getpic();
        this.hashtag = this.gethashtag();
        this.color = this.getcolor();
        this.style_type = this.getstyle_type();
        this.product_size = this.getproduct_size();
    },
};
</script>

<style lang="scss" scoped>
.imgBox {
    height: 100px;
    img {
        width: 100%;
        height: 100%;
        object-fit: contain;
    }
}
#edit_boxOutside {
    position: fixed;
    z-index: 10;
    width: 100%;
    height: 100%;
}
#edit_box {
    position: fixed;
    z-index: 10;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    width: 800px;
    height: fit-content;
    max-height: 90%;
    background-color: #fff;
    padding: 20px;
    border: 3px solid $main_color;
    overflow-y: scroll;
    border-radius: 10px;
    margin: auto;
    .form_item {
        display: flex;
        margin-bottom: 10px;
        flex-wrap: wrap;
        .mulpic {
            margin-bottom: 5px;
            margin-right: 10px;
            .file {
                width: 200px;
            }
        }
        .label {
            width: 100px;
            font-size: 20px;
            font-weight: 900;
            color: $main_color;
        }

        select,
        input {
            margin: 0 5px;
            //     width: calc(100% - 100px);
            //     font-size: 16px;
            //     height: 45px;
        }

        select {
            margin-right: 5px;
            width: 100px;
            border: 1px $main_color solid;
        }
        button {
            line-height: 30px;
            box-sizing: border-box;
            height: 30px;
            border-radius: 5px;
        }
    }
}

#lightbox.active {
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>