<template>
  <!-- 在這邊寫 -->
    <div class="back_end_shop">
        
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
            <tr v-for="(item,index) in subOrder" class="item" :key="index" @click="getItem(item)" >
              <th scope="row">{{item.mem_id}}</th>
              <td class="product_img">{{ item.mem_name }}</td>
              <td>{{ item.level_name }}</td>
              <td>{{ item.sub_time }}</td>
              <td>{{ item.style_name }}</td>
              <td>{{ item.body_shape }}</td>
              <td v-show="item.sub_status==1">未搭配</td>
              <td v-show="item.sub_status==2">已搭配</td>
              <!-- <td>{{ order.order_id }}</td> -->
              <!-- <button @click="open()">搭配</button> -->
              <!-- 新增編輯商品燈箱區 -->
            </tr>
            <div class="lightbox active" v-show="abc">
                <div class="edit_box">
                    <div class="info">
                        <div class="info-basic">
                            <p>會員編號: {{ memInfo.mem_id }}</p>
                            <p>姓名: {{ memInfo.mem_name }}</p>
                            <p>訂閱等級: {{ memInfo.level_name }}</p>
                        </div>
                        <div class="info-test">
                            <p>風格: {{ memInfo.style_name }}</p>
                            <p>身形: {{ memInfo.body_shape }}</p>
                        </div>
                    </div>
                    <div v-show="[2, 3, 4].includes(memInfo.product_item)" class="upper">
                        <label>上身: </label>
                        <select v-on:change="changeUpp" v-model="finalUpperName">
                            <option v-for="(u,upper) in upper" :key="upper">
                              {{u.product_name}}
                            </option>
                        </select>
                        <select v-model="finalUpperColor">
                            <option v-for="color in uppColorArr" :key="color">
                            {{color}}
                            </option>
                        </select>
                        <select v-model="finalUpperSize">
                            <option v-for="size in uppSizeArr" :key="size">
                            {{ size }}
                            </option>
                        </select>
                    </div>
                    <div v-show="[2, 3, 4].includes(memInfo.product_item)" class="lower">
                        <label>下身: </label>
                        <select v-on:change="changeLow" v-model="finalLowerName">
                            <option v-for="(l,lower) in lower" :key="lower">
                              {{l.product_name}}
                            </option>
                        </select>
                        <select v-model="finalLowerColor">
                            <option v-for="color in lowColorArr" :key="color">
                            {{color}}
                            </option>
                        </select>
                        <select v-model="finalLowerSize">
                            <option v-for="size in lowSizeArr" :key="size">
                            {{ size }}
                            </option>
                        </select>
                    </div>
                    <div v-show="[3, 4].includes(memInfo.product_item)" class="outer">
                        <label>外套: </label>
                        <select v-on:change="changeOut" v-model="finalOuterName">
                            <option v-for="(o,outer) in outer" :key="outer">
                              {{o.product_name}}
                            </option>
                        </select>
                        <select v-model="finalOuterColor">
                            <option v-for="color in outColorArr" :key="color">
                            {{color}}
                            </option>
                        </select>
                        <select v-model="finalOuterSize">
                            <option v-for="size in outSizeArr" :key="size">
                            {{ size }}
                            </option>
                        </select>
                    </div>
                    <div v-show="memInfo.product_item==4" class="shoes">
                        <label>鞋子: </label>
                        <select v-on:change="changeSho" v-model="finalShoesName">
                            <option v-for="(s,shoes) in shoes" :key="shoes">
                              {{s.product_name}}
                            </option>
                        </select>
                        <select v-model="finalShoesColor">
                            <option v-for="color in shoColorArr" :key="color">
                            {{color}}
                            </option>
                        </select>
                        <select v-model="finalShoesSize">
                            <option v-for="size in shoSizeArr" :key="size">
                            {{ size }}
                            </option>
                        </select>
                    </div>
                    <div class="confirm_box">
                        <button @click="insert">新增</button>
                        <button class="cancel" @click="cancel()">取消</button>
                    </div>
                </div>
            </div>
        </tbody>
        </table>
        <!-- 商品列表 end -->
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
  name: "SubscriptionMgmt",
  data() {
    return {
      // 所有產品
      products: [],
      // 產品種類
      products_type: [],
      // 上身
      upper:[],
      selectedUpp:[],
      uppColorArr:[],
      uppSizeArr:[],
      uppId:'',
      // 下身
      lower:[],
      selectedLow:[],
      lowColorArr:[],
      lowSizeArr:[],
      lowId:'',
      // 外套
      outer:[],
      selectedOut:[],
      outColorArr:[],
      outSizeArr:[],
      outId:'',
      // 鞋子
      shoes:[],
      selectedSho:[],
      shoColorArr:[],
      shoSizeArr:[],
      shoId:'',
      // -------
      subOrder:[],
      abc:false,
      memInfo:[],
      // 最重要的
      finalUpperName:'',
      finalUpperColor:'',
      finalUpperSize:'',
      finalUpperArr:{},
      // --
      finalLowerName:'',
      finalLowerColor:'',
      finalLowerSize:'',
      finalLowerArr:{},
      // --
      finalOuterName:'',
      finalOuterColor:'',
      finalOuterSize:'',
      finalOuterArr:{},
      // --
      finalShoesName:'',
      finalShoesColor:'',
      finalShoesSize:'',
      finalShoesArr:{},
      // ---
      finalOrder:[],
    };
  },
  created() {
    this.getResource();
  },
  methods: {
    getItem(item){
      // console.log(item);
      if(item.sub_status==2){
        this.abc=false;
        this.memInfo=item;
      }else{
        this.abc=true;
        this.memInfo=item;
        console.log(this.memInfo.product_item);
      }
      
    },
    cancel(){
      this.abc=false;
      let selects = document.querySelectorAll('select');
      for(let select of selects){
        select.selectedIndex=0;
      }
    },
    changeUpp(e){
      const select=e.target.value;
      this.selectedUpp = this.upper.find(u => u.product_name === select)
      this.uppColorArr=this.selectedUpp.product_color_name.split(',');
      this.uppSizeArr=this.selectedUpp.product_size.split(',');
      this.uppId=this.selectedUpp.product_id;
    },
    changeLow(e){
      const select=e.target.value;
      this.selectedLow = this.lower.find(u => u.product_name === select)
      this.lowColorArr=this.selectedLow.product_color_name.split(',');
      this.lowSizeArr=this.selectedLow.product_size.split(',');
      this.lowId=this.selectedLow.product_id;
    },
    changeOut(e){
      const select=e.target.value;
      this.selectedOut = this.outer.find(u => u.product_name === select)
      this.outColorArr=this.selectedOut.product_color_name.split(',');
      this.outSizeArr=this.selectedOut.product_size.split(',');
      this.outId=this.selectedOut.product_id;
    },
    changeSho(e){
      const select=e.target.value;
      this.selectedSho = this.shoes.find(u => u.product_name === select)
      this.shoColorArr=this.selectedSho.product_color_name.split(',');
      this.shoSizeArr=this.selectedSho.product_size.split(',');
      this.shoId=this.selectedSho.product_id;
    },
    // open() {
    //   let lightbox = document.querySelector("#lightbox"); // 燈箱
    //   lightbox.classList.add("active");
    // },
    // close() {
    //   //關燈箱
    //   let lightbox = document.querySelector("#lightbox"); // 燈箱
    //   lightbox.classList.remove("active");
    // },
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
        this.upper= this.products.filter(products => products.product_maintype==='上身');
        this.lower= this.products.filter(products => products.product_maintype==='下身');
        this.outer= this.products.filter(products => products.product_maintype==='外套');
        this.shoes= this.products.filter(products => products.product_maintype==='鞋款');
      });
    },
    insert(item){
      if(this.memInfo.product_item==2){
        const upp={product_id:this.uppId,product_name:this.finalUpperName,product_color_name:this.finalUpperColor,product_size:this.finalUpperSize};
        this.finalUpperArr=upp;
        const low={product_id:this.lowId,product_name:this.finalLowerName,product_color_name:this.finalLowerColor,product_size:this.finalLowerSize};
        this.finalLowerArr=low;
        // console.log(this.finalUpperArr);
        // console.log(this.finalLowerArr);
       
        this.finalOrder.push(this.finalUpperArr);
        this.finalOrder.push(this.finalLowerArr);
        // console.log(this.finalOrder);
      }else if(this.memInfo.product_item==3){
          const upp={product_id:this.uppId,product_name:this.finalUpperName,product_color_name:this.finalUpperColor,product_size:this.finalUpperSize};
          this.finalUpperArr=upp;
          const low={product_id:this.lowId,product_name:this.finalLowerName,product_color_name:this.finalLowerColor,product_size:this.finalLowerSize};
          this.finalLowerArr=low;
          const out={product_id:this.outId,product_name:this.finalOuterName,product_color_name:this.finalOuterColor,product_size:this.finalOuterSize};
          this.finalOuterArr=out;

          this.finalOrder.push(this.finalUpperArr);
          this.finalOrder.push(this.finalLowerArr);
          this.finalOrder.push(this.finalOuterArr);
          // console.log(this.finalOrder);
      }else{
          const upp={product_id:this.uppId,product_name:this.finalUpperName,product_color_name:this.finalUpperColor,product_size:this.finalUpperSize};
          this.finalUpperArr=upp;
          const low={product_id:this.lowId,product_name:this.finalLowerName,product_color_name:this.finalLowerColor,product_size:this.finalLowerSize};
          this.finalLowerArr=low;
          const out={product_id:this.outId,product_name:this.finalOuterName,product_color_name:this.finalOuterColor,product_size:this.finalOuterSize};
          this.finalOuterArr=out;
          const sho={product_id:this.shoId,product_name:this.finalShoesName,product_color_name:this.finalShoesColor,product_size:this.finalShoesSize};
          this.finalShoesArr=sho;

          this.finalOrder.push(this.finalUpperArr);
          this.finalOrder.push(this.finalLowerArr);
          this.finalOrder.push(this.finalOuterArr);
          this.finalOrder.push(this.finalShoesArr);
          // console.log(this.finalOrder);
      }
      let datas={};
      datas.order=this.finalOrder;
      datas.mem_id=this.memInfo.mem_id;
      datas.sub_id=this.memInfo.sub_id;
      console.log(datas);
      fetch(`${BASE_URL}/insertSubToOrder.php`,{
        method:"post",
        body:JSON.stringify(datas),
      })
      .then((data) =>{
				console.log(data);
				if (data.msg) {
					alert("已成功搭配");
				}
        this.abc=false;
			})
			.catch((error) => console.log(error));

    }

  },
  mounted() {
      let selects = document.querySelectorAll('select');
      for(let select of selects){
        select.selectedIndex=0;
      }
  },
};
</script>
<style lang="scss" scoped>
.back_end_shop {
  box-sizing: border-box;
  select {
    width: 120px;
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

  .lightbox {
    position: fixed;
    z-index: 10;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #00000080;
    // display: none;

    .edit_box {
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

  .lightbox.active {
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