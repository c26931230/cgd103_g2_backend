<template>
  <!-- 在這邊寫 -->
    <div class="back_end_shop">
        <!-- 新增編輯商品燈箱區 -->
        <div id="lightbox">
            <div id="edit_box" v-for="info in subOrder" :key="info">
                <div class="info">
                    <div class="info-basic">
                        <p>會員編號: {{ info.mem_id }}</p>
                        <p>姓名: {{ info.mem_name }}</p>
                        <p>訂閱等級: {{ info.level_name }}</p>
                    </div>
                    <div class="info-test">
                        <p>風格: {{ info.style_name }}</p>
                        <p>身形: {{ info.body_shape }}</p>
                    </div>
                </div>
                <div class="upper">
                    <label>上身: </label>
                    <select>
                        <option v-for="item in products" :key="item">
                        {{ item.product_name }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in products" :key="item">
                        {{ item.product_color }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in products" :key="item">
                        {{ item.product_size }}
                        </option>
                    </select>
                </div>
                <div class="lower">
                    <label>下身: </label>
                    <select>
                        <option v-for="item in products" :key="item">
                        {{ item.product_name }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in products" :key="item">
                        {{ item.product_color }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in products" :key="item">
                        {{ item.product_size }}
                        </option>
                    </select>
                </div>
                <div class="outer">
                    <label>外套: </label>
                    <select>
                        <option v-for="item in products" :key="item">
                        {{ item.product_name }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in products" :key="item">
                        {{ item.product_color }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in products" :key="item">
                        {{ item.product_size }}
                        </option>
                    </select>
                </div>
                <div class="shoes">
                    <label>鞋子: </label>
                    <select>
                        <option v-for="item in products" :key="item">
                        {{ item.product_name }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in products" :key="item">
                        {{ item.product_color }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in products" :key="item">
                        {{ item.product_size}}
                        </option>
                    </select>
                </div>
                <div class="confirm_box">
                    <button>新增</button>
                    <button id="cancel" @click="close(info)">取消</button>
                </div>
            </div>
        </div>
        <h2>訂閱服務管理</h2>
        <!-- 上方篩選區 -->
        <div class="filter_box">
        <select>
            <optgroup label="等級">
            <option value="allLevel">全部</option>
            <option value="Basic">BASIC</option>
            <option value="Standard">STANDARD</option>
            <option value="Ultra">ULTRA</option>
            </optgroup>
        </select>
        <select>
            <optgroup label="搭配狀態">
            <option value="allStatus">全部</option>
            <option value="Basic">已完成</option>
            <option value="Standard">處理中</option>
            <option value="Ultra">未完成</option>
            </optgroup>
        </select>
        <input type="text" placeholder="Search"/>
        <button class="search">search</button>
        </div>
        <!-- 上方篩選區 end -->
        <!-- 商品列表 -->
        <table class="table shop_table">
        <thead>
            <tr>
            <th scope="col">會員編號</th>
            <th scope="col">姓名</th>
            <th scope="col">訂閱等級</th>
            <th scope="col">訂閱日期</th>
            <th scope="col">風格</th>
            <th scope="col">身形</th>
            <th scope="col">搭配狀態</th>
            <!-- <th scope="col">出貨狀態</th> -->
            <!-- <th scope="col"></th> -->
            </tr>
        </thead>
        <tbody>
            <tr v-for="order in subOrder" class="item" :key="order" @click="open(info)">
            <th scope="row">{{order.mem_id}}</th>
            <td class="product_img">
                {{ order.mem_name }}
            </td>
            <td>{{ order.level_name }}</td>
            <td>{{ order.sub_time }}</td>
            <td>{{ order.style_name }}</td>
            <td>{{ order.body_shape }}</td>
            <td v-show="order.sub_status==1">未搭配</td>
            <td v-show="order.sub_status==2">已搭配</td>
            <!-- <td>{{ order.order_id }}</td> -->
            <!-- <button @click="open()">搭配</button> -->
            </tr>
        </tbody>
        </table>
        <!-- 商品列表 end -->
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
import { BASE_URL } from "@/assets/js/common.js";
export default {
  name: "SubscriptionMgmt",
  data() {
    return {
      products: [],
      subOrder:[]
    };
  },
  created() {
    this.getResource();
  },
  methods: {
    open() {
      let lightbox = document.querySelector("#lightbox"); // 燈箱
      lightbox.classList.add("active");
    },
    close() {
      //關燈箱
      lightbox.classList.remove("active");
    },
    getResource(){
      this.axios.get(`${BASE_URL}/getSubOrder.php`)
      .then((response) => {
        console.log(response.data);
        this.subOrder = response.data;
      });
      this.axios.get(`${BASE_URL}/mainproduct.php`)
      .then((response) => {
        console.log(response.data);
        this.products= response.data;
      });
    }
  }
};
</script>
<style lang="scss" scoped>
.back_end_shop {
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

  input:not(input[type="file"]) {
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
      .upper,.lower,.outer,.shoes{
        display: flex;
        gap: 20px;
        padding: 5px;
        align-items: center;
      }
      .info {
        display: flex;
        flex-direction: column;
        .info-basic {
          display: flex;
          gap: 40px;
        }
        .info-test {
          display: flex;
          gap: 40px;
        }
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
          height: 45px;
        }

        select {
          padding: 5px 0;
          margin-right: 5px;
          width: 80px;
          border: 1px $main_color solid;
        }

        #tag {
          width: 100px;
        }

        #tag_box {
          border: 1px $main_color solid;
          min-height: 45px;
          width: calc(100% - 205px);
          margin-left: 5px;
          position: relative;
          display: flex;
          justify-content: flex-start;
          flex-wrap: wrap;
          align-items: center;

          span {
            background-color: $main_color;
            padding: 3px 6px;
            color: #fff;
            margin: 5px;
            cursor: pointer;

            span {
              font-size: 12px;
            }
          }
        }
      }
    }
  }

  #lightbox.active {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .wrap {
    .sub_form_item {
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

      .option {
        // 子項目
        position: relative;
        display: flex;
        justify-content: space-between;
        width: 100%;

        input:nth-child(1) {
          // 檔案
          width: 200px;
          padding: 5px 0;
        }

        input:nth-child(2) {
          // 顏色
          width: 80px;
          font-size: 16px;
          outline: none;
          height: 45px;
          border: 1px $main_color solid;
        }
      }
    }
  }

  .confirm_box {
    margin-top: 20px;
    text-align: center;

    button {
      margin: 0 5px;
    }
  }

  // 商品列表-上方篩選區
  .filter_box {
    display: flex;
    align-items: stretch;
    position: relative;

    select,
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
    margin: 10px 0;
  }

  // 商品列表
  .shop_table {
    background-color: #fff;
    border-radius: 10px;
    overflow: hidden;
    margin-top: 50px;

    .filter_box select,
    .filter_box button {
      margin: 0 5px;
    }
    button {
      border-radius: 20px;
      height: 38px;
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
        &:hover {
          background-color: rgb(246, 246, 255);
        }

        .product_img {
          img {
            width: 100px; // 商品圖
          }
        }
      }
    }
  }
}
</style>