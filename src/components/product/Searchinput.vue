<template>
    <div>
        <input
            type="text"
            v-model="searchInput"
            placeholder="Search..."
            @keyup="search()"
        />
    </div>
</template>
<script>
export default {
    data() {
        return {
            searchInput: "",
        };
    },
    methods: {
        search() {
            this.$emit("sendsearch", this.searchInput);
        },
    },
};
</script>
<style lang="scss" scoped>
input {
    height: 45px;
    margin: 0 5px;
}
</style>