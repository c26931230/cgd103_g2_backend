<template>
  <div class="back_end_member">
    <h2>訂單管理</h2>
    <!-- 上方篩選區 -->
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

    <div class="filter_box">
      <!-- 考慮修改成select -->
      <input type="text" placeholder="Search" />
      <button class="search" @click="search">search</button>
    </div>
    <!-- 上方篩選區 end -->
    <!-- 會員列表 -->
    <table class="table member_table">
      <thead>
        <tr>
          <th scope="col">訂單編號</th>
          <th scope="col">下單日期</th>
          <th scope="col">訂單金額</th>
          <th scope="col">訂購人</th>
          <th scope="col">物流狀態</th>
          <th scope="col">訂單留言</th>
        </tr>
      </thead>

      <!-- <div class="operate_box">
        <button id="create" @click="open_add_box()">新增員工</button>
      </div> -->

      <tbody>
        <tr
          v-for="e in orders"
          class="item"
          :key="e[0].order_id"
          @click="show(e[0].order_id)"
        >
          <th scope="row">{{ e[0].order_id }}</th>
          <!-- 編號 -->
          <!-- <router-link to="/OrderMgntDetail">

                    </router-link> -->
          <td>{{ e[0].order_time }}</td>
          <!-- 下單日期 -->
          <td>{{ e[0].total }}</td>
          <!-- 訂單金額 -->
          <td>{{ e[0].ord_mem }}</td>
          <!-- 訂購人-->
          <td>
            <!-- 物流狀態 -->
            <p v-if="e.order_con == 1">訂單取消</p>
            <p v-else-if="e.order_con == 2">商品配送中</p>
            <p v-else>商品已送達</p>
          </td>
          <!-- 訂單狀態 -->
          <td>
            <p v-if="e[0].order_con == 1">{{ e[0].meg_cont }}</p>
            <p v-else>尚無留言</p>
            <!-- <p v-if="e[0].order_con == 1">{{ e[0].meg_cont }}</p>
            <p v-else>尚無留言</p> -->
          </td>
        </tr>
      </tbody>
    </table>
    <!-- 會員列表 end -->
    <!-- 頁碼 -->
    <!-- <nav aria-label="...">
      <ul class="pagination">
        <li class="page-item disabled">
          <span class="page-link">Previous</span>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item active" aria-current="page">
          <span class="page-link">2</span>
        </li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#">Next</a>
        </li>
      </ul>
    </nav> -->
    <!-- 頁碼 end -->
  </div>
</template>
    <script>
import { BASE_URL } from "@/assets/js/common.js";
export default {
  name: "OrderMgmt",
  data() {
    return {
      orders: [
        //訂單資訊
      ],
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
      //取得廠商留言資料
      this.axios.get(`${BASE_URL}/OrderMgnt/getOrd.php`).then((response) => {
        console.log(response.data);
        this.orders = response.data;

        //把得到的資料分組
        const groupBy = (array, key) =>
          array.reduce((objectsByKeyValue, obj) => {
            const value = obj[key];
            objectsByKeyValue[value] = (objectsByKeyValue[value] || []).concat(
              obj
            );
            return objectsByKeyValue;
          }, {});

        this.orders = groupBy(this.orders, "order_id");
      });
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
        if (empRow.emp_state === 1) {
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
  },
  mounted() {
    this.getResource();
  },
};
</script>
    <style lang="scss" scoped>
$main_color: #495bff;

router-link {
  list-style: none;
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

.back_end_member {
  box-sizing: border-box;
  // 會員列表-上方篩選區
  .filter_box {
    display: flex;
    align-items: stretch;
    button.search {
      outline: none;
      border: 1px $main_color solid;
      margin: 0;
    }
  }
  button {
    min-width: 70px;
    outline: none;
    border: none;
    background-color: $main_color;
    color: #fff;
    height: 45px;
    padding: 0px 10px;
    margin: 10px;
    &:hover {
      background-color: rgb(119, 121, 139);
    }
  }
  input {
    outline: none;
    border: 1px $main_color solid;
    margin: 0%;
  }
  h2 {
    font-weight: 600;
    color: $main_color;
    // padding: 10px;
    margin: 10px 0;
  }
  // 會員列表
  .member_table {
    background-color: #fff;
    border-radius: 10px;
    overflow: hidden;
    margin-top: 50px;
  }
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

button.subButton {
  border-radius: 10%;
  background-color: rgb(100, 100, 163);
  margin: 0;
}
</style>