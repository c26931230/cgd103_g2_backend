<template>
  <div class="col-9 px-3 py-3 border border-primary bg-light">
    <div class="titleBox">
      <h2>穿搭提案</h2>
      <button>確認上傳</button>
    </div>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">星期</th>
          <th scope="col" colspan="2">男</th>
          <th scope="col" colspan="2">女</th>
        </tr>
      </thead>
      <tbody>
 
        <tr>
          <th scope="row">Monday</th>
          <td>
            <img class="box" v-if="image" :src="image" width="200px"/>
          </td>
          <td><input type="file" accept="image/*" @change="changeFile" id="theFile" /></td>
          <td>
            <img class="box" v-if="image" :src="image" width="200px"/>
          </td>
          <td><input type="file" accept="image/*" @change="changeFile" id="theFile" /></td>
        </tr>
 
        <tr>
          <th scope="row">Monday</th>
          <td>
            <img
              class="box"
              id="image"
              src="https://picsum.photos/200/300/?random=10"
            />
          </td>
          <td><input type="file" placeholder="穿搭組合商品" id="theFile" /></td>
          <td><img src="https://picsum.photos/200/300/?random=10" /></td>
          <td><input type="file" placeholder="穿搭組合商品" /></td>
        </tr>
        <tr>
          <th scope="row">Monday</th>
          <td>
            <img
              class="box"
              id="image"
              src="https://picsum.photos/200/300/?random=10"
            />
          </td>
          <td><input type="file" placeholder="穿搭組合商品" id="theFile" /></td>
          <td><img src="https://picsum.photos/200/300/?random=10" /></td>
          <td><input type="file" placeholder="穿搭組合商品" /></td>
        </tr>
        <tr>
          <th scope="row">Monday</th>
          <td>
            <img
              class="box"
              id="image"
              src="https://picsum.photos/200/300/?random=10"
            />
          </td>
          <td><input type="file" placeholder="穿搭組合商品" id="theFile" /></td>
          <td><img src="https://picsum.photos/200/300/?random=10" /></td>
          <td><input type="file" placeholder="穿搭組合商品" /></td>
        </tr>
        <tr>
          <th scope="row">Monday</th>
          <td>
            <img
              class="box"
              id="image"
              src="https://picsum.photos/200/300/?random=10"
            />
          </td>
          <td><input type="file" placeholder="穿搭組合商品" id="theFile" /></td>
          <td><img src="https://picsum.photos/200/300/?random=10" /></td>
          <td><input type="file" placeholder="穿搭組合商品" /></td>
        </tr>
        <tr>
          <th scope="row">Monday</th>
          <td>
            <img
              class="box"
              id="image"
              src="https://picsum.photos/200/300/?random=10"
            />
          </td>
          <td><input type="file" placeholder="穿搭組合商品" id="theFile" /></td>
          <td><img src="https://picsum.photos/200/300/?random=10" /></td>
          <td><input type="file" placeholder="穿搭組合商品" /></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
    export default {
    data() {
      return {
        image:'',
       
      }
    },
 
    methods:{
      changeFile(e){
        const file = e.target.files.item(0);
        const reader = new FileReader();
        reader.addEventListener('load',this.imageLoaded);
        reader.readAsDataURL(file);
      },
 
      imageLoaded(e){
        this.image = e.target.result;
      }
    }
 
 
};
</script>
 
<style lang="scss" scope>
.titleBox {
  background-color: #fff;
  display: flex;
  justify-content: space-between;
}
input {
  width: 80px;
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
.box {
  border: 1px solid black;
  width: 200px;
  height: 300px;
}
 
table {
  background-color: #fff;
  border-radius: 10px;
  overflow: hidden;
  margin-top: 10px;
 
  .filter_box select,
  .filter_box button {
    margin: 0 5px;
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
}
</style>

