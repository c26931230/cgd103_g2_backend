<template>
  <div class="back_end_employee">
    <div id="lightbox">
      <div id="edit_box">
        <div class="item">
          <h3>諮詢方向</h3>
          <p>嘗試更多風格，不想思考每天要穿什麼</p>
        </div>
        <div class="item">
          <h3>文字描述</h3>
          <p>
            嘗試更多風格，不想思考每天要穿什麼，想要更多靈感，想學穿搭不知道怎麼開始，不確定特定場合怎麼穿搭。嘗試更多風格，不想思考每天要穿什麼，想要更多靈感，想學穿搭不知道怎麼開始，不確定特定場合怎麼穿搭。
          </p>
        </div>
        <div class="item">
          <h3>狀態</h3>
          <select>
            <option value="">已完成</option>
            <option value="">未完成</option>
          </select>
        </div>
        <div class="confirm_box">
          <button @click="close()">修改確定</button>
          <button id="cancel" @click="close()">取消</button>
        </div>
      </div>
    </div>
    <!-- 新增編輯員工燈箱區 end -->
    <h2>會員預約管理</h2>
    <!-- 上方篩選區 -->
    <div class="filter_box">
      <button>全部</button>
      <button>未完成</button>
      <button>已完成</button>
      <input type="text" placeholder="Search" />
      <button class="search">search</button>
      <!-- <button id="create" @click="open()">新增員工</button> -->
    </div>
    <!-- 上方篩選區 end -->
    <!-- 員工列表 -->
    <table class="table employee_table">
      <thead>
        <tr>
          <th scope="col">預約日期</th>
          <th scope="col">預約時間</th>
          <th scope="col">會員編號</th>
          <th scope="col">姓名</th>
          <th scope="col">諮詢方向</th>
          <th scope="col">文字描述</th>
          <th scope="col">諮詢風格</th>
          <th scope="col">狀態</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="item in appointment"
          class="item"
          :key="item.id"
          @click="open()"
        >
          <th scope="row">{{ item.appointment_date }}</th>
          <!-- 預約日期 -->
          <th scope="row">{{ item.appointment_time }}</th>
          <!-- 預約時間 -->
          <th scope="row">{{ item.mem_id }}</th>
          <!-- 會員編號 -->
          <td>{{ item.emp_name }}</td>
          <!-- 姓名 -->
          <td>{{ item.appointment_qa }}</td>
          <!-- 諮詢方向 -->
          <td>{{ item.appointment_desc }}</td>
          <!-- 文字描述 -->
          <td>{{ item.appointment_style }}</td>
          <!-- 諮詢風格 -->
          <td>{{ item.appointment_state }}</td>
          <!-- 狀態 -->
        </tr>
      </tbody>
    </table>
    <!-- 員工列表 end -->
    <!-- 頁碼 -->
    <nav aria-label="...">
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
    </nav>
    <!-- 頁碼 end -->
  </div>
</template>
<script>
export default {
  name: "StaffMgnt",
  data() {
    return {
      appointment: [
        //預約資訊
        {
          appointment_date: "2023/01/01",
          appointment_time: "16:00",
          mem_id: 1001,
          emp_name: "jason",
          appointment_qa: "對自己的穿搭沒自信",
          appointment_desc: "對自己的穿搭沒自信...",
          appointment_style: "文青風",
          appointment_state: "已完成",
        },
        {
          appointment_date: "2023/01/01",
          appointment_time: "16:00",
          mem_id: 1002,
          emp_name: "jason",
          appointment_qa: "對自己的穿搭沒自信",
          appointment_desc: "對自己的穿搭沒自信...",
          appointment_style: "文青風",
          appointment_state: "已完成",
        },
        {
          appointment_date: "2023/01/01",
          appointment_time: "16:00",
          mem_id: 1003,
          emp_name: "jason",
          appointment_qa: "對自己的穿搭沒自信",
          appointment_desc: "對自己的穿搭沒自信...",
          appointment_style: "文青風",
          appointment_state: "已完成",
        },
        {
          appointment_date: "2023/01/01",
          appointment_time: "16:00",
          mem_id: 1004,
          emp_name: "jason",
          appointment_qa: "對自己的穿搭沒自信",
          appointment_desc: "對自己的穿搭沒自信...",
          appointment_style: "文青風",
          appointment_state: "已完成",
        },
        {
          appointment_date: "2023/01/01",
          appointment_time: "16:00",
          mem_id: 1005,
          emp_name: "jason",
          appointment_qa: "對自己的穿搭沒自信",
          appointment_desc: "對自己的穿搭沒自信...",
          appointment_style: "文青風",
          appointment_state: "已完成",
        },
        {
          appointment_date: "2023/01/01",
          appointment_time: "16:00",
          mem_id: 1006,
          emp_name: "jason",
          appointment_qa: "對自己的穿搭沒自信",
          appointment_desc: "對自己的穿搭沒自信...",
          appointment_style: "文青風",
          appointment_state: "已完成",
        },
        {
          appointment_date: "2023/01/01",
          appointment_time: "16:00",
          mem_id: 1007,
          emp_name: "jason",
          appointment_qa: "對自己的穿搭沒自信",
          appointment_desc: "對自己的穿搭沒自信...",
          appointment_style: "文青風",
          appointment_state: "未完成",
        },
        {
          appointment_date: "2023/01/01",
          appointment_time: "16:00",
          mem_id: 1008,
          emp_name: "jason",
          appointment_qa: "對自己的穿搭沒自信",
          appointment_desc: "對自己的穿搭沒自信...",
          appointment_style: "文青風",
          appointment_state: "未完成",
        },
        {
          appointment_date: "2023/01/01",
          appointment_time: "16:00",
          mem_id: 1009,
          emp_name: "jason",
          appointment_qa: "對自己的穿搭沒自信",
          appointment_desc: "對自己的穿搭沒自信...",
          appointment_style: "文青風",
          appointment_state: "未完成",
        },
        {
          appointment_date: "2023/01/01",
          appointment_time: "16:00",
          mem_id: 1010,
          emp_name: "jason",
          appointment_qa: "對自己的穿搭沒自信",
          appointment_desc: "對自己的穿搭沒自信...",
          appointment_style: "文青風",
          appointment_state: "未完成",
        },
      ],
    };
  },
  methods: {
    open() {
      let lightbox = document.querySelector("#lightbox"); // 燈箱
      lightbox.classList.add("active");
      const items = document.querySelectorAll(".item"); // 員工個人資料項目
      items.forEach((item) => {
        //點擊員工個人資料項目開燈箱
        item.addEventListener("click", (e) => {
          lightbox.classList.add("active");
        });
      });
    },
    close() {
      //關燈箱
      lightbox.classList.remove("active");
    },
  },
};
</script>
<style lang="scss">
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

  #lightbox {
    position: fixed;
    z-index: 10;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #00000080;
    display: none;

    #edit_box {
      width: 640px;
      min-height: 300px;
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      background-color: #fff;
      box-shadow: #00000010 0 0 20px 0px;
      .item {
        margin-bottom: 30px;
      }
      h3 {
        font-size: 20px;
        color: $main_color;
        font-weight: 600;
      }
      p {
        font-size: 16px;
      }
    }
  }

  #lightbox.active {
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

    #create {
      margin-left: auto;
    }

    .search {
      margin: 0;
    }
  }

  h2 {
    font-weight: 600;
    color: $main_color;
    padding: 10px;
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
</style>