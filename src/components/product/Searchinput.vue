<template>
    <div class="me-1">
        <input
            type="text"
            :value="search"
            placeholder="Search..."
            class="form-control"
            @change="$emit('update:search', $event.target.value)"
        />
    </div>
</template>
<script>
export default {
    name: "Searchinput",
    emits: ["update:search"],
    props: { search: String },
};
</script>
<style lang="scss" scoped>
input {
    height: 45px;
    margin: 0 5px;
}
</style>