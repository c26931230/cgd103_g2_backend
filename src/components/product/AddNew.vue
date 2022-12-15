<template>
    <div id="lightbox"></div>

    <form id="edit_box" method="post">
        <div class="form_item">
            <label for="title">品名</label>
            <input
                type="text"
                id="title"
                v-model="add.product_name"
                maxlength="10"
            />
        </div>
        <div class="form_item">
            <label for="price">售價</label>
            <input
                type="number"
                id="price"
                v-model="add.unit_price"
                min="1"
                max="1000000"
            />
        </div>
        <div class="form_item">
            <label for="state">上架狀態</label>
            <select name="" id="state" v-model="add.product_state">
                <option value="0">下架</option>
                <option value="1">上架</option>
            </select>
        </div>
        <div class="form_item">
            <label for="">分類</label>
            <selected @typesend="catchType"></selected>
        </div>
        <div class="form_item">
            <label for="style">風格</label>
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
        <div class="form_item">
            <label for="body">身形</label>
            <select name="" id="body" v-model="add.body_type">
                <option value="梨型">梨型</option>
                <option value="蘋果型">蘋果型</option>
                <option value="矩形">矩形</option>
                <option value="沙漏型">沙漏型</option>
                <option value="倒三角型">倒三角型</option>
            </select>
        </div>

        <div class="form_item">
            <label for="size">風格</label>

            <label for="XS">
                <input
                    id="XS"
                    type="checkbox"
                    value="XS"
                    v-model="product_size"
                />XS</label
            >
            <label for="S">
                <input
                    id="S"
                    type="checkbox"
                    value="S"
                    v-model="product_size"
                />S</label
            >
            <label for="M">
                <input
                    id="M"
                    type="checkbox"
                    value="M"
                    v-model="product_size"
                />M</label
            >
            <label for="L">
                <input
                    id="L"
                    type="checkbox"
                    value="L"
                    v-model="product_size"
                />L</label
            >
            <label for="XL">
                <input
                    id="XL"
                    type="checkbox"
                    value="XL"
                    v-model="product_size"
                />XL</label
            >
        </div>

        <div class="form_item">
            <label for="file">圖片</label>
            <div>
                <div class="mul" v-for="(item, index) in pic" :key="index">
                    <input type="file" @change="onFileChange(index, $event)" />
                    <button @click="removeInput(index)">-</button>
                </div>
                <button @click="addInput">+</button>
            </div>
        </div>

        <div class="form_item">
            <label for="file">顏色</label>
            <div>
                <div class="mul" v-for="(e, i) in color" :key="i">
                    <input type="color" v-model="e.value" />
                    <button @click="removeInputColor">-</button>
                </div>
                <button @click="addInputColor">+</button>
            </div>

            <div class="btn_box"></div>
        </div>

        <div class="form_item">
            <label for="file">hashtag</label>
            <div>
                <div class="mul" v-for="(e, i) in hashtag" :key="i">
                    <input v-model="e.value" />
                    <button @click="removeInputTag">-</button>
                </div>
                <button @click="addInputTag">+</button>
            </div>
        </div>

        <div class="confirm_box">
            <button class="main" @click="addProduct()">新增</button>
            <!-- <button>修改確定</button> -->
            <button class="main" id="cancel" @click="close()">取消</button>
            <input type="reset" />
        </div>
    </form>
</template>
<script>
import Selected from "./Selected.vue";
export default {
    components: { Selected },
    data() {
        return {
            type: {},
            pic: [{ value: "" }],
            hashtag: [{ value: "" }],
            color: [{ value: "" }],
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
                product_size: "",
            },
        };
    },
    methods: {
        close() {},
        addProduct() {
            this.add.style_type = this.style_type.join(",");
            this.add.product_pic = this.pic.map((item) => item.value).join(",");
            this.add.hashtag = this.hashtag.map((item) => item.value).join(",");
            this.add.product_color = this.color
                .map((item) => item.value)
                .join(",");
            this.add.product_size = this.product_size.join(",");

            // const xhr = new XMLHttpRequest();
            // xhr.onreadystatechange = function () {
            //     if (
            //         xhr.readyState === XMLHttpRequest.DONE &&
            //         xhr.status === 200
            //     ) {
            //         const responseData = xhr.responseText;
            //         // 在這裡處理服務器返回的數據
            //         console.log(responseData);
            //     }
            // };
            // xhr.open("post", "/api_server/prod_insert.php", true);
            // xhr.setRequestHeader(
            //     "Content-Type",
            //     "application/json; charset=UTF-8"
            // );
            // xhr.send(JSON.stringify(this.add));

            fetch("api_server/prod_insert.php", {
                method: "POST",
                body: JSON.stringify(this.add),
            })
                .then((response) => response.json())
                .then((data) => {
                    // 在這裡處理服務器返回的數據
                    console.log(data);
                });
        },
        catchType(val) {
            // console.log(val);
            this.type = val;
            // console.log(this.type);
            this.add.product_gender = this.type?.gender;
            this.add.product_maintype = this.type?.mainType;
            this.add.product_type = this.type?.type;
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
};
</script>
<style lang="scss" scoped>
#lightbox {
    position: fixed;
    z-index: 10;
    width: 100%;
    height: 100%;
    // background-color: #00000080;
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
            height: 45px;
            margin-bottom: 10px;
            input {
                height: 45px;
            }
        }
        label {
            width: 100px;
            font-size: 20px;
            font-weight: 900;
            color: $main_color;
            line-height: 45px;
        }

        select,
        input {
            margin: 0 5px;
            //     width: calc(100% - 100px);
            //     font-size: 16px;
            //     height: 45px;
        }

        select {
            padding: 5px 0;
            margin-right: 5px;
            width: 80px;
            border: 1px $main_color solid;
        }
        button {
            width: 30px;
            height: 30px;
            box-sizing: border-box;
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