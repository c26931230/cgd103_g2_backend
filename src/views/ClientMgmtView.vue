<template>
  <div class="back_end_member">
    <h2>廠商留言</h2>
    <!-- 上方篩選區 -->
    <div class="filter_box">
      <input type="text" placeholder="Search" />
      <button class="search" @click="search">search</button>
    </div>
    <!-- 上方篩選區 end -->
    <!-- 編輯廠商留言燈箱區 start -->
    <div id="lightbox1">
      <div id="edit_box1">
        <form id="update_employee" method="post" enctype="multipart/form-data">
          <div class="form_item">
            <label for="emp_id1">留言者</label>
            <p id="client_id1">{{ client.client_id }}</p>
          </div>
          <div class="form_item">
            <label for="emp_name1">留言內容</label>
          </div>

          <div class="form_item">
            <label for="">回覆狀態</label>
            <div class="item">
              <div class="op">
                <input type="radio" name="emp_state1" value="1" id="normal1" />
                <label for="normal1">已回覆</label>
              </div>
              <div class="op">
                <input type="radio" name="emp_state1" value="0" id="resign1" />
                <label for="resign1">未回覆</label>
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
    <!-- 會員列表 -->
    <table class="table member_table">
      <thead>
        <tr>
          <th scope="col">留言時間</th>
          <th scope="col">廠商名稱</th>
          <th scope="col">廠商電話</th>
          <th scope="col">留言者</th>
          <th scope="col">留言內容</th>
          <th scope="col">回覆狀態</th>
          <th scope="col">確認按鈕</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="e in client"
          class="item"
          :key="e.client_id"
          @click="show(e.client_id)"
        >
          <!-- 留言時間 -->
          <th scope="row">{{ e.clientmes_time }}</th>
          <!-- 廠商名稱 -->
          <td>{{ e.client_person }}</td>
          <!-- 廠商名稱 -->
          <td>0{{ e.client_phone }}</td>
          <!-- 留言者姓名 -->
          <td>{{ e.client_name }}</td>
          <!-- 留言內容 -->
          <td class="msg">{{ e.client_meg }}</td>
          <!-- 回覆狀態-->
          <td>
            <select name="" id="">
              <option v-if="e.reply == 0">未回覆</option>
              <option v-if="e.reply == 0">已回覆</option>
              <option v-else>已回覆</option>
            </select>
            <!-- <span v-if="e.reply == 0">未回覆</span>
            <span v-else>已回覆</span> -->
          </td>
          <button>確認修改</button>
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
  name: "ClientMgmtMgmt",
  data() {
    return {
      client: [], //廠商資訊
      search: "",
      reply: "",
    };
  },
  methods: {
    getResource() {
      //取得廠商留言資料
      this.axios
        .get(`${BASE_URL}/OrderMgnt/getClientMsg.php`)
        .then((response) => {
          console.log(response.data);
          this.client = response.data;
        });
    },
  },
  show(x) {
    //show  參考StaffMgnt頁面的  員工資料
    let xhr = new XMLHttpRequest();
    xhr.onload = function () {
      let empRow = JSON.parse(xhr.responseText);
      document.getElementById("client_id1").value = empRow.client_id;
      document.getElementById("emp_name1").value = empRow.emp_name;
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
    let url = `${BASE_URL}/OrderMgnt/getClientMsg.php?client_id1=` + x;
    xhr.open("get", url, true);
    xhr.send(null);
  },
  mounted() {
    this.getResource();
  },
};
</script>
    <style lang="scss" scoped>
$main_color: #495bff;
.back_end_member {
  box-sizing: border-box;
  // 會員列表-上方篩選區
  .filter_box {
    display: flex;
    align-items: stretch;
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
    margin-left: 0;
    padding-left: 0;
    text-align: center;
    &:hover {
      background-color: rgb(119, 121, 139);
    }
  }
  svg {
    margin: 14px;
  }
  input {
    outline: none;
    border: 1px $main_color solid;
    margin: 10px;
    margin-right: 0;
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
    height: 100%;
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

td.msg {
  width: 300px;
}

button.subButton {
  border-radius: 10%;
  background-color: rgb(100, 100, 163);
}
</style>