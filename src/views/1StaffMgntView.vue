<template>
    <div>首頁>>會員專區</div>
    會員帳號<input type="text" name="memId" id="memId" />
    <button @click="checkId()">check</button>
    <p id="msg"></p>

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
            this.axios.get("/api_server/list.php")
                .then((res) => {
                    console.log(res)
                })
        },
        checkId(){
            //產生 XMLHttpRequest 物件
            var xhr = new XMLHttpRequest();

            // 註冊 callback function
            xhr.onload = function(){
                document.getElementById("msg").innerText = xhr.responseText;
            }
            let url = "/api_server/list.php?memId=" + document.getElementById("memId").value;
            xhr.open("get", url, true);
            //送出資料
            xhr.send(null);
        }

    },
  

};
</script>
<style lang="scss" scoped>

</style>