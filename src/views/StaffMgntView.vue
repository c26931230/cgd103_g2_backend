<template>
  <div class="back_end_employee">
    <!-- 新增員工燈箱區 start -->
    <div id="lightbox">
      <div id="edit_box">
        <form id="add_employee" method="post" enctype="multipart/form-data">
          <div class="form_item">
            <label for="emp_name">員工姓名</label>
            <input
              type="text"
              id="emp_name"
              name="emp_name"
              required
              v-model="emp_name"
            />
          </div>
          <div class="form_item">
            <label>員工身分</label>
            <div class="item">
              <div class="op">
                <input
                  type="radio"
                  name="job"
                  value="員工"
                  id="emp_op"
                  v-model="job"
                />
                <label for="emp_op">員工</label>
              </div>
              <div class="op">
                <input
                  type="radio"
                  name="job"
                  value="造型師"
                  id="stylist_op"
                  v-model="job"
                />
                <label for="stylist_op">造型師</label>
              </div>
            </div>
          </div>
          <div class="form_item">
            <label for="hiredate">到職日期</label>
            <input
              type="date"
              id="hiredate"
              name="hiredate"
              v-model="hiredate"
            />
          </div>
          <div class="form_item">
            <label for="emp_pwd">密碼</label>
            <input
              type="password"
              id="emp_pwd"
              name="emp_pwd"
              v-model="emp_pwd"
            />
          </div>
          <div class="form_item">
            <label for="emp_mail">電子郵件</label>
            <input
              type="email"
              id="emp_mail"
              name="emp_mail"
              @blur="validateEmail"
              required
              v-model="emp_mail"
            />
            <!-- 存在:{{ emailExists }}
            不符合:{{ emailUnForm }} -->
            <div v-if="emailExists" class="emailExists">此帳號已註冊</div>
            <div v-if="emailUnForm" class="emailUnForm">Email 格式不正確</div>
          </div>
          <div class="form_item">
            <label for="">狀態</label>
            <div class="item">
              <div class="op">
                <input
                  type="radio"
                  name="emp_state"
                  value="1"
                  id="normal"
                  v-model="emp_state"
                />
                <label for="normal">在職</label>
              </div>
              <div class="op">
                <input
                  type="radio"
                  name="emp_state"
                  value="0"
                  id="resign"
                  v-model="emp_state"
                />
                <label for="resign">離職</label>
              </div>
            </div>
          </div>
        </form>
        <div class="confirm_box">
          <button :disabled="notSubmit" @click="insert">確認</button>
          <button id="cancel" @click="close()">取消</button>
        </div>
      </div>
    </div>
    <!-- 新增員工燈箱區 end -->
    <!-- 編輯員工燈箱區 start -->
    <div id="lightbox1">
      <div id="edit_box1">
        <form id="update_employee" method="post" enctype="multipart/form-data">
          <div class="form_item">
            <label for="emp_id1">員工編號</label>
            <input type="text" id="emp_id1" name="emp_id1" />
          </div>
          <div class="form_item">
            <label for="emp_name1">員工姓名</label>
            <input type="text" id="emp_name1" name="emp_name1" />
          </div>
          <div class="form_item">
            <label>員工身分</label>
            <div class="item">
              <div class="op">
                <input type="radio" name="job1" value="員工" id="emp_op1" />
                <label for="emp_op1">員工</label>
              </div>
              <div class="op">
                <input
                  type="radio"
                  name="job1"
                  value="造型師"
                  id="stylist_op1"
                />
                <label for="stylist_op1">造型師</label>
              </div>
            </div>
          </div>
          <div class="form_item">
            <label for="hiredate1">到職日期</label>
            <input type="date" id="hiredate1" name="hiredate1" />
          </div>
          <div class="form_item">
            <label for="emp_pwd1">密碼</label>
            <input type="password" id="emp_pwd1" name="emp_pwd1" />
          </div>
          <div class="form_item">
            <label for="emp_mail1">電子郵件</label>
            <input type="email" id="emp_mail1" name="emp_mail1" />
            <div v-if="emailExists" class="emailExists">此帳號已註冊</div>
            <div v-if="emailUnForm" class="emailUnForm">Email 格式不正確</div>
          </div>
          <div class="form_item">
            <label for="">狀態</label>
            <div class="item">
              <div class="op">
                <input type="radio" name="emp_state1" value="1" id="normal1" />
                <label for="normal1">在職</label>
              </div>
              <div class="op">
                <input type="radio" name="emp_state1" value="0" id="resign1" />
                <label for="resign1">離職</label>
              </div>
            </div>
          </div>
        </form>
        <div class="confirm_box">
          <button @click="update()" id="update">修改</button>
          <button id="cancel1" @click="close()">取消</button>
        </div>
      </div>
    </div>
    <!-- 編輯員工燈箱區 end -->
    <h2>員工管理</h2>
    <!-- 上方篩選區 -->
    <div class="filter_box">
      <input type="text" placeholder="Search" v-model="search" />
      <button class="search">search</button>
      <div id="showPanel"></div>
      <div class="operate_box">
        <button id="create" @click="open_add_box()">新增員工</button>
      </div>
    </div>
    <!-- 上方篩選區 end -->
    <!-- 員工列表 -->
    <table class="table employee_table">
      <thead>
        <tr>
          <th scope="col">員工編號</th>
          <th scope="col">姓名</th>
          <th scope="col">職稱</th>
          <th scope="col">到職日</th>
          <th scope="col">mail</th>
          <th scope="col">帳號狀態</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="e in employee"
          class="item"
          :key="e.emp_id"
          @click="show(e.emp_id)"
        >
          <!-- 員工編號 -->
          <th scope="row">{{ e.emp_id }}</th>
          <!-- 姓名 -->
          <td>{{ e.emp_name }}</td>
          <!-- 職稱 -->
          <td>{{ e.job }}</td>
          <!-- 到職日 -->
          <td>{{ e.hiredate }}</td>
          <!-- mail -->
          <td>{{ e.emp_mail }}</td>
          <!-- 帳號狀態 -->
          <td>
            <span v-if="e.emp_state == 0">離職</span>
            <span v-else>在職</span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
//引入BASE_URL參數
import { BASE_URL } from "@/assets/js/common.js";
export default {
  name: "StaffMgnt",
  data() {
    return {
      employee: [], //員工資訊
      search: "",
      // ===
      emailExists: false, // email 是否已註冊
      emailUnForm: false, // emamil 格式
      notSubmit: false, //不能送出
      emp_name: "",
      emp_mail: "",
      job: "",
      hiredate: "",
      emp_pwd: "",
      emp_mail: "",
      emp_state: "",
      res_msg: "",
    };
  },
  methods: {
    open_add_box() {
      //開啟新增燈箱
      let lightbox = document.querySelector("#lightbox"); // 新增燈箱
      lightbox.classList.add("active");
    },
    close() {
      //關燈箱
      lightbox.classList.remove("active"); // 關新增燈箱
      lightbox1.classList.remove("active"); // 關修改燈箱
    },
    getResource() {
      //取得員工資料
      this.axios.get(`${BASE_URL}/StaffMgnt/empList.php`).then((response) => {
        // console.log(response.data);
        this.employee = response.data;
      });
    },
    insert() {
      //新增員工
      // let xhr = new XMLHttpRequest();
      // xhr.onload = function () {
      //   let result = JSON.parse(xhr.responseText);
      //   alert(result.msg);
      // };
      // xhr.open("post", `${BASE_URL}/StaffMgnt/empInsert.php`, true);
      // xhr.send(new FormData(document.getElementById("add_employee")));
      const data = {
        emp_name: this.emp_name,
        job: this.job,
        hiredate: this.hiredate,
        emp_pwd: this.emp_pwd,
        emp_mail: this.emp_mail,
        emp_state: this.emp_state,
        action: "add_emp",
      };
      fetch(`${BASE_URL}/StaffMgnt/empInsert.php`, {
        method: "post",
        body: new URLSearchParams(data),
      })
        .then((res) => res.json())
        .then((json) => alert(json.msg));
      lightbox.classList.remove("active"); // 關新增燈箱
    },
    show(x) {
      //show 員工資料
      let xhr = new XMLHttpRequest();
      xhr.onload = function () {
        let empRow = JSON.parse(xhr.responseText);
        document.getElementById("emp_id1").value = empRow.emp_id;
        document.getElementById("emp_name1").value = empRow.emp_name;
        console.log("job = ", empRow.job);
        if (empRow.job === "員工") {
          //員工
          document.getElementById("emp_op1").checked = true;
        } else {
          //造型師
          document.getElementById("stylist_op1").checked = true;
        }
        document.getElementById("hiredate1").value = empRow.hiredate;
        document.getElementById("emp_pwd1").value = empRow.emp_pwd;
        document.getElementById("emp_mail1").value = empRow.emp_mail;
        if (empRow.emp_state === "1") {
          //在職
          document.getElementById("normal1").checked = true;
        } else {
          //離職
          document.getElementById("resign1").checked = true;
        }
        //開啟修改燈箱
        let lightbox1 = document.querySelector("#lightbox1"); // 修改燈箱
        lightbox1.classList.add("active");
      };
      let url = `${BASE_URL}/StaffMgnt/getEmp.php?emp_id1=` + x;
      xhr.open("get", url, true);
      xhr.send(null);
    },
    update() {
      //修改資料
      let xhr = new XMLHttpRequest();
      xhr.onload = function () {
        console.log(xhr.responseText);
        let result = JSON.parse(xhr.responseText);
        alert(result.msg);
      };
      xhr.open("post", `${BASE_URL}/StaffMgnt/emp_update.php`, true);
      xhr.send(new FormData(document.getElementById("update_employee")));
      lightbox1.classList.remove("active"); // 關修改燈箱
    },
    // =========
    // email 格式不正確，出現div ，且無法送出
    IfemailUnForm() {
      this.emailUnForm = true;
      this.notSubmit = true;
      this.emailExists = false;
    },
    // 帳號已註冊，出現 div，且無法送出
    IfemailExists() {
      this.emailUnForm = false;
      this.emailExists = true;
      this.notSubmit = true;
    },
    // 檢查 email 格式，並檢查是否已註冊
    validateEmail() {
      const self = this;
      let EMAIL_REGEX =
        /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]{1,64}@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}$/;
      // 檢查 eamil 格式
      if (EMAIL_REGEX.test(this.emp_mail)) {
        // 電子郵件格式正確
        self.emailUnForm = false;
        self.notSubmit = true; 
        //檢查是否已註冊過
        const data = {
          emp_mail: self.emp_mail,
          action: "check_email",
        };
        fetch(`${BASE_URL}/StaffMgnt/empInsert.php`, {
          method: "post",
          body: new URLSearchParams(data),
        })
          .then((res) => res.json())
          .then((data) => {
            if (data.msg == "此帳號已註冊") {
              this.IfemailExists();
              console.log(data.msg);
            } else {
              this.emailExists = false;
              this.notSubmit = false;
            }
          });
      } else {
        // 電子郵件格式不正確
        this.IfemailUnForm();
      }
    },
    validateOther() {},
  },
  mounted() {
    this.getResource();
  },
  computed: {
    employee() {
      //搜尋功能
      let cache = this.employee;
      if (this.search != "") {
        cache = cache.filter((item) => {
          let str_id = String(item.emp_id);
          let up_search = this.search.toLocaleUpperCase();
          let up_name = item.emp_name.toLocaleUpperCase();
          return (
            str_id.includes(this.search) ||
            up_name.includes(up_search) ||
            item.job.includes(this.search)
          );
        });
      }
      return cache;
    },
  },
};
</script>
<style lang="scss" scoped>
.back_end_employee {
  box-sizing: border-box;

  select {
    width: 80px;
    font-size: 16px;
    border: 1px $main_color solid;
    height: 45px;
  }

  button {
    min-width: 70px;
    outline: none;
    border: none;
    background-color: $main_color;
    color: #fff;
    height: 45px;
    padding: 0px 10px;
  }

  input {
    outline: none;
    border: 1px $main_color solid;
  }

  #lightbox,
  #lightbox1 {
    position: fixed;
    z-index: 10;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #00000080;
    display: none;

    #edit_box,
    #edit_box1 {
      width: 640px;
      min-height: 300px;
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      background-color: #fff;
      box-shadow: #00000010 0 0 20px 0px;

      .form_item {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        margin-bottom: 10px;

        label {
          width: 100px;
          font-size: 20px;
          font-weight: 900;
          color: $main_color;
          line-height: 45px;
        }

        input:not([type="radio"]) {
          width: calc(100% - 100px);
          font-size: 16px;
          border: 1px $main_color solid;
          height: 45px;
        }

        .item {
          .op {
            margin-right: 10px;
            display: inline-block;

            label {
              color: $text_color;
              font-size: 16px;
              width: fit-content;
              font-weight: normal;
            }
          }
        }
      }
    }
  }

  #lightbox.active,
  #lightbox1.active {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .confirm_box {
    margin-top: 20px;
    text-align: center;

    button {
      margin: 0 5px;
    }
  }

  // 員工列表-上方篩選區
  .filter_box {
    display: flex;
    align-items: stretch;
    position: relative;

    button {
      margin: 0 5px;
    }

    .operate_box {
      margin-left: auto;
    }

    .search {
      margin: 0;
    }
  }

  h2 {
    font-weight: 600;
    color: $main_color;
    padding: 10px 0;
  }

  /* 員工列表 */
  .employee_table {
    background-color: #fff;
    border-radius: 10px;
    overflow: hidden;
    margin-top: 50px;

    thead {
      background-color: $main_color;
      color: #fff;

      tr {
        th {
          font-weight: 600; // 表頭
        }
      }
    }

    tbody {
      .item {
        cursor: pointer;
      }
    }
  }
}
.form_item {
  .emailExists,
  .emailUnForm {
    color: red;
    margin-left: 100px;
  }
}
</style>