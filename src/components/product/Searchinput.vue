<template>
    <div>
        <input
            type="text"
            :value="search"
            placeholder="Search..."
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