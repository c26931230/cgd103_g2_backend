<template>
  <div class="col-9 px-3 py-3">
    <div class="titlebox">
      <h2>穿搭提案</h2>
      <button>確認上傳</button>
    </div>
    <table class="table">
      <thead class="thead">
        <tr>
          <th>星期</th>
        </tr>
        <tr>
          <th>男</th>
        </tr>
        <tr>
          <th>女</th>
        </tr>
      </thead>
      <tbody class="tbody">
        <tr>
          <td class="week">週一</td>
          <td class="week">週二</td>
          <td class="week">週三</td>
          <td class="week">週四</td>
          <td class="week">週五</td>
          <td class="week">週末</td>
        </tr>
        <tr>
          <td class="box" v-for="(item, index) in list" :key="item.index">
            <div class="imageArea">
              <label :for="item.i">
                <input
                  type="file"
                  :val="index"
                  :id="item.i"
                  ref="fileInput"
                  accept="image/*"
                  @change="onFilePicked"
                />
              </label>
            </div>
            <div class="updateShow">
              <label :for="item.i" style="height: 100%">
                <img :src="item.url" height="280" />
              </label>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
export default {
  data() {
    return {
      selectedFile: null,
      image: null,
      list: [
        {
          url: "",
        },
        {
          url: "",
        },
        {
          url: "",
        },
        {
          url: "",
        },
        {
          url: "",
        },
        {
          url: "",
        },
        {
          url: "",
        },
        {
          url: "",
        },
        {
          url: "",
        },
        {
          url: "",
        },
        {
          url: "",
        },
        {
          url: "",
        },
      ],
    };
  },

  methods: {
    onFilePicked(event) {
      let val = event.target.getAttribute("val");
      const files = event.target.files;
      const fileReader = new FileReader();
      fileReader.addEventListener("load", () => {
        this.list[val]["url"] = fileReader.result;
      });
      fileReader.readAsDataURL(files[0]);
      this.image = files[0];
    },
  },
};
</script>

<style lang="scss" scope> 
    input{
        width: 80px;
    }
    .box{
        border: 1px solid black;
        width:200px ;
        height:300px;
    }
</style>

