<template>
    <div id="lightbox" @click="$emit('close')"></div>

    <div id="edit_box">
        <div class="form_item">
            <div class="label">品名</div>
            <div>
                <input
                    class="form-control"
                    type="text"
                    id="title"
                    v-model.trim="add.product_name"
                    maxlength="10"
                    required="required"
                />
            </div>
        </div>
        <div class="form_item">
            <div class="label">售價</div>
            <div>
                <input
                    class="form-control"
                    type="number"
                    id="price"
                    v-model.trim="add.unit_price"
                    min="1"
                    max="1000000"
                />
            </div>
        </div>
        <div class="form_item">
            <div class="label">上架狀態</div>
            <select
                class="form-control"
                id="state"
                v-model.trim="add.product_state"
            >
                <option value="0">下架</option>
                <option value="1">上架</option>
            </select>
        </div>
        <div class="form_item">
            <div class="label">分類</div>
            <SelectType
                v-model:selected1="add.product_gender"
                v-model:selected2="add.product_maintype"
                v-model:selected3="add.product_type"
            ></SelectType>
        </div>
        <!-- 風格 -->
        <div class="form_item">
            <div class="label">風格</div>
            <label for="A">
                <input
                    id="A"
                    type="checkbox"
                    value="極簡風"
                    v-model="style_type"
                />極簡風</label
            >
            <label for="B">
                <input
                    id="B"
                    type="checkbox"
                    value="文青風"
                    v-model="style_type"
                />文青風</label
            >
            <label for="C">
                <input
                    id="C"
                    type="checkbox"
                    value="休閒風"
                    v-model="style_type"
                />休閒風</label
            >
            <label for="D">
                <input
                    id="D"
                    type="checkbox"
                    value="時尚風"
                    v-model="style_type"
                />時尚風</label
            >
        </div>
        <!-- 身形 -->
        <div class="form_item">
            <div class="label">身形</div>
            <select class="form-select" id="body" v-model="add.body_type">
                <option value="梨型">梨型</option>
                <option value="蘋果型">蘋果型</option>
                <option value="矩形">矩形</option>
                <option value="沙漏型">沙漏型</option>
                <option value="倒三角型">倒三角型</option>
            </select>
        </div>
        <!-- 尺寸 -->
        <div class="form_item">
            <div class="label">尺寸</div>
            <div class="d-flex flex-wrap col-10">
                <div
                    class="input-group-text mb-1 me-1"
                    v-for="e in arrSize"
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
        <!-- 圖片 -->
        <div class="form_item">
            <div class="label">圖片</div>
            <div>
                <div class="mul" v-for="(item, index) in pic" :key="index">
                    <input
                        class="form-control"
                        ref="fileInput"
                        type="file"
                        @change="onFileChange(index, $event)"
                        accept="image/*"
                    />
                    <button class="m-1" @click="removeInput(index)">-</button>
                </div>
                <button class="m-1" @click="addInput">+</button>
            </div>
        </div>
        <!-- 顏色 -->
        <div class="form_item">
            <div class="label">顏色</div>
            <div>
                <div class="mul d-flex" v-for="(e, i) in color" :key="i">
                    <input
                        type="color"
                        v-model="e.value"
                        class="form-control color me-1"
                    />
                    <input
                        type="text"
                        v-model="e.text"
                        class="form-control w80"
                    />
                    <button class="m-1" @click="removeInputColor">-</button>
                </div>
                <button class="m-1" @click="addInputColor">+</button>
            </div>
            <div class="btn_box"></div>
        </div>
        <!-- hashtag -->
        <div class="form_item">
            <div class="label">hashtag</div>
            <div>
                <div class="mul d-flex" v-for="(e, i) in hashtag" :key="i">
                    <input v-model.trim="e.value" class="form-control" />
                    <button class="m-1" @click="removeInputTag">-</button>
                </div>
                <button class="m-1" @click="addInputTag">+</button>
            </div>
        </div>
        <div class="form_item">
            <div class="label">描述</div>
            <div class="w-75">
                <textarea
                    class="form-control textarea"
                    type="textarea"
                    id="title"
                    v-model.trim="add.product_text"
                    maxlength="10"
                    required="required"
                    rows="3"
                ></textarea>
            </div>
        </div>

        <div class="confirm_box">
            <button class="main" @click="addProduct()">新增</button>
            <button class="main" id="cancel" @click="$emit('close')">
                取消
            </button>
            <button class="main" id="cancel" @click="reset()">重設</button>
        </div>
    </div>
</template>
<script>
import SelectType from "@/components/product/SelectType.vue";
export default {
    name: "AddNew",
    components: { SelectType },
    emits: ["close"],
    data() {
        return {
            arrSize: [
                "XS",
                "S",
                "M",
                "L",
                "XL",
                "F",
                22,
                23,
                24,
                25,
                26,
                27,
                28,
                29,
                30,
                31,
            ],
            arrshoseSize: [22, 23, 24, 25, 26, 27, 28, 29, 30, 31],
            type: {},
            pic: [{ value: "" }],
            hashtag: [{ value: "" }],
            color: [{ value: "#000000", text: "" }],
            style_type: [],
            product_size: [],
            add: {
                product_name: "",
                hashtag: "",
                unit_price: "",
                product_state: "",
                product_maintype: "",
                product_type: "",
                product_pic: "",
                style_type: "",
                body_type: "",
                product_gender: "",
                product_color: "",
                product_color_name: "",
                product_size: "",
                product_text: "",
            },
        };
    },
    methods: {
        close() {},
        resetFileInput() {
            const input = this.$refs.fileInput;
            input.value = null;
            input.type = "file";
            this.$refs.fileInput = new FileList();
        },
        reset() {
            this.add = {
                product_name: "",
                hashtag: "",
                unit_price: "",
                product_state: "",
                product_maintype: "",
                product_type: "",
                product_pic: "",
                style_type: "",
                body_type: "",
                product_gender: "",
                product_color: "",
                product_color_name: "",
                product_size: "",
                product_text: "",
            };
            this.pic = [];
            this.hashtag = [];
            this.color = [];
            this.style_type = [];
            this.product_size = [];
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
            this.add.product_color_name = this.color
                .map((item) => item.text)
                .join(",");

            for (const x in this.color) {
                console.log(x);
                if (this.color[x].value === "") {
                    console.log(x);
                    alert("顏色未選");
                    return;
                }
                if (this.color[x].text === "") {
                    console.log(x);
                    alert("顏色描述未填");
                    return;
                }
            }
            for (const x in this.hashtag) {
                console.log(x);
                if (this.hashtag[x].value === "") {
                    console.log(x);
                    alert("hashtag未填");
                    return;
                }
            }
            for (const x in this.pic) {
                console.log(x);
                if (this.pic[x].value === "") {
                    console.log(x);
                    alert("圖片未填");
                    return;
                }
            }

            for (const key in this.add) {
                console.log(this.add[key]);
                if (this.add[key] == "") {
                    switch (key) {
                        case "body_type":
                            alert("身形未填");
                            return;
                        case "hashtag":
                            alert("hashtag未填");
                            return;
                        case "product_color":
                            alert("顏色未填");
                            return;
                        case "product_color_name":
                            alert("顏色未填");
                            return;
                        case "product_pic":
                            alert("圖片未選");
                            return;
                        case "product_maintype":
                            alert("種類未填");
                            return;
                        case "product_gender":
                            alert("性別未填");
                            return;
                        case "product_name":
                            alert("名稱未填");
                            return;
                        case "product_size":
                            alert("尺寸未填");
                            return;
                        case "product_state":
                            alert("上架狀態未填");
                            return;
                        case "product_text":
                            alert("敘述未填");
                            return;
                        case "product_type":
                            alert("種類未填");
                            return;
                        case "style_type":
                            alert("風格未填");
                            return;
                        case "unit_price":
                            alert("價格未填");
                            return;
                        default:
                    }
                }
            }

            fetch("api_server/prod_insert.php", {
                method: "post",
                body: JSON.stringify(this.add),
            })
                .then((response) => response.json())
                .then((data) => {
                    // 在這裡處理服務器返回的數據
                    alert(data.msg);
                    this.$emit("close");
                });
        },

        onFileChange(index, event) {
            const files = event.target.files;
            if (files && files.length > 0) {
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
            this.color.push({ value: "#000000", text: "" });
        },
        removeInputColor(index) {
            this.color.splice(index, 1);
        },
    },
};
</script>
<style lang="scss" scoped>
#lightbox {
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
        .mul {
            // height: 45px;
            margin-bottom: 5px;
        }
        .label {
            width: 100px;
            font-size: 20px;
            font-weight: 900;
            color: $main_color;
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
            min-width: 30px;
            border-radius: 5px;
        }
    }
}

.color {
    height: 39px;
    width: 100px;
}

#lightbox.active {
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>