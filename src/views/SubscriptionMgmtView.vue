<template>
  <!-- 在這邊寫 -->
    <div class="back_end_shop">
        <!-- 新增編輯商品燈箱區 -->
        <div id="lightbox">
            <div id="edit_box">
                <div class="info">
                    <div class="info-basic">
                        <p>會員編號: {{ match[0].mem_id }}</p>
                        <p>姓名: {{ match[0].mem_name }}</p>
                        <p>訂閱等級: {{ match[0].mem_level }}</p>
                    </div>
                    <div class="info-test">
                        <p>風格: {{ match[0].style_id }}</p>
                        <p>身形:{{ match[0].body_id }}</p>
                    </div>
                </div>
                <div class="upper">
                    <label>上身: </label>
                    <select>
                        <option v-for="item in product" :key="item.id">
                        {{ item.title }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in product" :key="item.color">
                        {{ item.color }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in product" :key="item.size">
                        {{ item.size }}
                        </option>
                    </select>
                </div>
                <div class="lower">
                    <label>下身: </label>
                    <select>
                        <option v-for="item in product" :key="item.id">
                        {{ item.title }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in product" :key="item.color">
                        {{ item.color }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in product" :key="item.size">
                        {{ item.size }}
                        </option>
                    </select>
                </div>
                <div class="outer">
                    <label>外套: </label>
                    <select>
                        <option v-for="item in product" :key="item.id">
                        {{ item.title }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in product" :key="item.color">
                        {{ item.color }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in product" :key="item.size">
                        {{ item.size }}
                        </option>
                    </select>
                </div>
                <div class="shoes">
                    <label>鞋子: </label>
                    <select>
                        <option v-for="item in product" :key="item.id">
                        {{ item.title }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in product" :key="item.color">
                        {{ item.color }}
                        </option>
                    </select>
                    <select>
                        <option v-for="item in product" :key="item.size">
                        {{ item.size }}
                        </option>
                    </select>
                </div>
                <div class="confirm_box">
                    <button>新增</button>
                    <button id="cancel" @click="close()">取消</button>
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
        <input type="text" placeholder="Search" />
        <button class="search">search</button>
        </div>
        <!-- 上方篩選區 end -->
        <!-- 商品列表 -->
        <table class="table shop_table">
        <thead>
            <tr>
            <th scope="col">會員編號</th>
            <th scope="col">姓名</th>
            <th scope="col">訂閱</th>
            <th scope="col">付款狀態</th>
            <th scope="col">訂閱日期</th>
            <th scope="col">風格</th>
            <th scope="col">身形</th>
            <th scope="col">搭配狀態</th>
            <th scope="col">出貨狀態</th>
            <th scope="col"></th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="mem in match" class="item" :key="mem.id">
            <th scope="row">{{ mem.mem_id }}</th>
            <td class="product_img">
                {{ mem.mem_name }}
            </td>
            <td>{{ mem.mem_level }}</td>
            <td>{{ mem.payStatus }}</td>
            <td>{{ mem.sub_time }}</td>
            <td>{{ mem.style_id }}</td>
            <td>{{ mem.body_id }}</td>
            <td>{{ mem.matchStatus }}</td>
            <td>{{ mem.shippingStatus }}</td>
            <button @click="open()">搭配</button>
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
export default {
  name: "SubscriptionMgmt",
  data() {
    return {
      match: [
        {
          mem_id: "A001",
          mem_name: "金太妍",
          mem_level: "ULTRA",
          body_id: "沙漏型",
          style_id: "時尚風",
          payStatus: "已付款",
          sub_time: "2022/12/01",
          matchStatus: "未完成",
          product_item: 2,
          shippingStatus: "未出貨",
          matchList: [],
        },
        {
          mem_id: "A002",
          mem_name: "陳咚咚",
          mem_level: "BASIC",
          body_id: "沙漏型",
          style_id: "運動風",
          payStatus: "已付款",
          sub_time: "2022/12/01",
          matchStatus: "未完成",
          product_item: 2,
          shippingStatus: "已出貨",
          matchList: [],
        },
        {
          mem_id: "A003",
          mem_name: "李知恩",
          mem_level: "BASIC",
          body_id: "菱形",
          style_id: "文青風",
          payStatus: "已付款",
          sub_time: "2022/12/01",
          matchStatus: "未完成",
          product_item: 2,
          shippingStatus: "未成立",
          matchList: [],
        },
        {
          mem_id: "A004",
          mem_name: "蔡英文",
          mem_level: "ULTRA",
          body_id: "沙漏型",
          style_id: "運動風",
          payStatus: "已付款",
          sub_time: "2022/12/01",
          matchStatus: "未完成",
          product_item: 2,
          shippingStatus: "未出貨",
          matchList: [],
        },
        {
          mem_id: "A005",
          mem_name: "馬英九",
          mem_level: "BASIC",
          body_id: "正方型",
          style_id: "極簡風",
          payStatus: "已付款",
          sub_time: "2022/12/01",
          matchStatus: "未完成",
          product_item: 2,
          shippingStatus: "未成立",
          matchList: [],
        },
        {
          mem_id: "A006",
          mem_name: "陳時中",
          mem_level: "ULTRA",
          body_id: "圓型",
          style_id: "運動風",
          payStatus: "已付款",
          sub_time: "2022/12/01",
          matchStatus: "未完成",
          product_item: 2,
          shippingStatus: "已出貨",
          matchList: [],
        },
        {
          mem_id: "A007",
          mem_name: "魏如萱",
          mem_level: "STANDARD",
          body_id: "三角型",
          style_id: "運動風",
          payStatus: "已付款",
          sub_time: "2022/12/01",
          matchStatus: "未完成",
          product_item: 2,
          shippingStatus: "未出貨",
          matchList: [],
        },
      ],
      product: [
        //產品資訊
        {
          id: 1,
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          title: "UNISEX 環保刷毛帽T",
          type: "上身",
          color: "黑",
          size: "XL",
          price: 1980,
          description:
            "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
          category: "men's clothing",
          state: "上架",
          tag: "毛衣",
        },
        {
          id: 2,
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          title: "UNISEX 環保刷毛帽T",
          type: "上身",
          color: "黑",
          size: "XL",
          price: 1980,
          description:
            "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
          category: "men's clothing",
          state: "上架",
          tag: "毛衣",
        },
        {
          id: 3,
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          title: "UNISEX 環保刷毛帽T",
          type: "上身",
          color: "黑",
          size: "XL",
          price: 1980,
          description:
            "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
          category: "men's clothing",
          state: "上架",
          tag: "毛衣",
        },
      ],
    };
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
  },
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