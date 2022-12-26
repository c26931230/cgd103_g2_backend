<template>
    <div class="filter_box">
        <select
            class="form-select"
            :value="selected1"
            @change="$emit('update:selected1', $event.target.value)"
        >
            <option
                v-for="(option, i) in MF"
                :value="option.value"
                :key="i"
                :disabled="option.value == ''"
            >
                {{ option.text }}
            </option>
        </select>
        <select
            class="form-select"
            :value="selected2"
            @change="$emit('update:selected2', $event.target.value)"
        >
            <option
                v-for="(option, i) in product_maintype"
                :value="option.value"
                :key="i"
                :disabled="option.value == ''"
            >
                {{ option.text }}
            </option>
        </select>
        <select
            class="form-select"
            :value="selected3"
            @change="$emit('update:selected3', $event.target.value)"
        >
            <option
                v-for="(option, i) in selectProduct_maintype"
                :value="option.value"
                :key="i"
                :disabled="option.value == ''"
            >
                {{ option.text }}
            </option>
        </select>
    </div>
</template>
<script>
export default {
    name: "SelectType",
    // emits: ["selected1", "uselected2", "selected3"],
    props: {
        selected1: { Number, default: "" },
        selected2: { String, default: "" },
        selected3: { String, default: "" },
    },
    data() {
        return {
            searchInput: "",

            MF: [
                { value: "", text: "請選擇" },
                { value: "0", text: "女裝" },
                { value: "1", text: "男裝" },
            ],
            product_maintype: [
                { value: "", text: "請選擇" },
                { value: "上身", text: "上身" },
                { value: "下身", text: "下身" },
                { value: "鞋款", text: "鞋款" },
                { value: "配件", text: "配件" },
            ],
            product_type: {
                default: { value: "", text: "請選擇" },
                top: [
                    { value: "短袖", text: "短袖" },
                    { value: "長袖", text: "長袖" },
                    { value: "外套", text: "外套" },
                ],
                down: [
                    { value: "短褲", text: "短褲" },
                    { value: "長褲", text: "長褲" },
                    { value: "裙子", text: "裙子" },
                ],
                shoes: [
                    { value: "皮鞋", text: "皮鞋" },
                    { value: "跟鞋", text: "跟鞋" },
                    { value: "運動鞋", text: "運動鞋" },
                ],
                other: [
                    { value: "包款", text: "包款" },
                    { value: "配件", text: "配件" },
                ],
            },
        };
    },
    computed: {
        selectProduct_maintype() {
            if (this.selected1 == 1) {
                this.product_type.down = [
                    { value: "短褲", text: "短褲" },
                    { value: "長褲", text: "長褲" },
                ];
                this.product_type.shoes = [
                    { value: "皮鞋", text: "皮鞋" },
                    { value: "運動鞋", text: "運動鞋" },
                ];
            } else {
                this.product_type.down = [
                    { value: "短褲", text: "短褲" },
                    { value: "長褲", text: "長褲" },
                    { value: "裙子", text: "裙子" },
                ];
                this.product_type.shoes = [
                    { value: "跟鞋", text: "跟鞋" },
                    { value: "皮鞋", text: "皮鞋" },
                    { value: "運動鞋", text: "運動鞋" },
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
                    // const QQ = { value: "" };
                    // console.log(Object.values(this.product_type).flat());
                    return Object.values(this.product_type).flat();
            }
        },
    },

    methods: {},
};
</script>
<style lang="scss" scoped>
.filter_box button {
    margin: 0 5px;
}
</style>