<template>
    <div id="loginBox">
        <form action="/api_server/2_sessionLogin.php" method="post">
            <p>帳號: <input type="text" name="memId"></p>
            <p>密碼: <input type="password" name="memPsw"></p>
            <p><input type="submit" value="登入"></p>
        </form>
    </div>

</template>
<script>
// import {BASE_URL} from '@/assets/js/commom.js'
export default {
    // name: "StaffMgnt",
    data() {
        return {
        }
    },
    methods: {
        showAll() {
            this.axios.get("/api_server/2_sessionLogin.php")
                .then((res) => {
                    console.log(res)
                })
        },
       

    },
  

};
</script>
<style lang="scss" scoped>

</style>