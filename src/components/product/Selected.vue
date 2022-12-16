<template>
    <div class="filter_box">
        <select v-model="selected1" @change="emitSelect">
            <option v-for="(option, i) in MF" :value="option.value" :key="i">
                {{ option.text }}
            </option>
        </select>
        <select v-model="selected2" @change="emitSelect">
            <option
                v-for="(option, i) in product_maintype"
                :value="option.value"
                :key="i"
            >
                {{ option.value }}
            </option>
        </select>
        <select v-model="selected3" @change="emitSelect">
            <option
                v-for="(option, i) in selectProduct_maintype"
                :value="option.value"
                :key="i"
            >
                {{ option.value }}
            </option>
        </select>
        {{ selected1 }}
        {{ selected2 }}
        {{ selected3 }}
    </div>
</template>
<script>
export default {
    data() {
        return {
            selected1: "",
            selected2: "",
            selected3: "",
            searchInput: "",

            MF: [
                { value: "0", text: "女裝" },
                { value: "1", text: "男裝" },
                // { value: "2", text: "全部" },
            ],
            product_maintype: [
                { value: "上身", text: "上身" },
                { value: "下身", text: "下身" },
                { value: "鞋款", text: "鞋款" },
                { value: "配件", text: "配件" },
            ],
            product_type: {
                top: [{ value: "短袖" }, { value: "長袖" }, { value: "外套" }],
                down: [{ value: "短褲" }, { value: "長褲" }, { value: "裙子" }],
                shoes: [
                    { value: "皮鞋" },
                    { value: "跟鞋" },
                    { value: "運動鞋" },
                ],
                other: [{ value: "包款" }, { value: "配件" }],
            },
        };
    },
    computed: {
        selectProduct_maintype() {
            if (this.selected1 == 1) {
                this.product_type.down = [{ value: "短褲" }, { value: "長褲" }];
                this.product_type.shoes = [
                    { value: "皮鞋" },
                    { value: "運動鞋" },
                ];
            } else {
                this.product_type.down = [
                    { value: "短褲" },
                    { value: "長褲" },
                    { value: "裙子" },
                ];
                this.product_type.shoes = [
                    { value: "皮鞋" },
                    { value: "跟鞋" },
                    { value: "運動鞋" },
                ];
            }
            switch (this.selected2) {
                case "上身": {
                    return this.product_type.top;
                }
                case "下身":
                    return this.product_type.down;
                case "鞋款":
                    return this.product_type.shoes;
                case "配件":
                    return this.product_type.other;
                default:
                    return Object.values(this.product_type).flat();
            }
        },
    },
    watch: {
        selected1: function () {
            this.reset();
            this.emitSelect();
        },
        selected2: function () {
            this.selected3 = "";
            this.emitSelect();
        },
    },
    methods: {
        reset() {
            this.selected2 = this.selected3 = "";
        },
        emitSelect() {
            const type = {
                gender: this.selected1,
                mainType: this.selected2,
                type: this.selected3,
            };
            // console.log(type);
            this.$emit("typesend", type);
        },
    },
};
</script>
<style lang="scss" scoped>
.filter_box select,
.filter_box button {
    margin: 0 5px;
}
</style>