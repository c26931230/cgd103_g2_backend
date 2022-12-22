<template>
  <div class="backend_login_box">
    <div class="form_box">
      <form id="login" method="post" enctype="multipart/form-data">
        <div id="edit_box">
          <h2>登入</h2>
          <div class="form_item">
            <label for="account">帳號</label>
            <input type="text" id="account" name="emp_id" />
          </div>
          <div class="form_item">
            <label for="password">密碼</label>
            <input type="password" id="password" name="emp_pwd" />
          </div>
          <div class="remember_box">
            <input type="checkbox" id="remember" />
            <label for="remember">記住我</label>
            <a href="">忘記密碼?</a>
          </div>

          <div class="confirm_box">
            <div class="btn_s" @click="doLogin()">登入</div>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>
<script>
//引入BASE_URL參數
import { BASE_URL } from "@/assets/js/common.js";
export default {
  data() {
    return {
    };
  },
  methods: {
    doLogin() {
      var xhr = new XMLHttpRequest();
      xhr.onload = () => {
        console.log(xhr.responseText);
        if (xhr.status == 200) {
          if (xhr.responseText != 0) {
            alert("登入成功！");
            this.session = JSON.parse(xhr.responseText);
            console.log(this.session);
            sessionStorage.setItem("employee", JSON.stringify(this.session));
            this.loginStatus = sessionStorage.getItem("employee");
            this.emp_job = JSON.parse(sessionStorage.getItem("employee")).job;
            if (this.loginStatus != "" && this.emp_job === "員工") {
              this.$router.push("/OperationMgnt");
            }else if(this.loginStatus != "" && this.emp_job === "造型師"){
              this.$router.push("/ClothingMatchMgnt");
            }
          } else if (xhr.responseText == 0) {
            alert("帳號或密碼錯誤");
          }
        }
      };
      xhr.open("POST", `${BASE_URL}/login.php`, true);
      xhr.send(new FormData(document.getElementById("login")));
      document.getElementById("account").value = "";
      document.getElementById("password").value = "";
    },

  },
  mounted() {
  },
};
</script>
<style lang="scss" scoped>
// 登入
.backend_login_box {
  background-color: #495bff10;
  width: 100%;
  height: 100%;
  position: absolute;

  #edit_box {
    position: fixed;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    min-height: 300px;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    background-color: #fff;
    box-shadow: #00000010 0 0 20px 0px;

    h2 {
      color: $main_color;
      font-weight: 600;
      font-size: 30px;
      text-align: center;
    }

    .form_item {
      display: flex;
      align-items: flex-start;
      margin-bottom: 10px;

      label {
        width: 100px;
        font-size: 20px;
        font-weight: 900;
        color: $main_color;
        line-height: 45px;
      }

      input {
        width: calc(100% - 100px);
        font-size: 16px;
        border: 1px $main_color solid;
        height: 45px;
        outline: none;
      }
    }

    .remember_box {
      position: relative;

      label {
        color: $text_color;
        font-size: 16px;
      }

      a {
        text-decoration: none;
        display: inline-block;
        position: absolute;
        right: 0;
        color: $text_color;
        font-size: 16px;
      }
    }

    .confirm_box {
      div {
        display: block;
        margin: 20px auto;
        width: 100%;
        cursor: pointer;
        text-align: center;
      }
    }
  }
}
</style>