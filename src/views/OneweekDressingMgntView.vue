<template>
  <div class="col-9 px-3 py-3">
    <div class="titlebox">
      <h2>穿搭提案</h2>
      <button>確認上傳</button>
      <select name="" id="">
          <option value="" disabled selected> 週別 </option>
          <option value="" v-for="i in 30" :key="i">{{ i }}</option>
      </select>
    </div>
    <table class="table">
      <thead class="thead">
        <tr style="width: 90px">
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
                <img :src="item.url" />
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

<style lang="scss" scoped>
h2 {
  font-size: 32px;
  color: $main_color;
  font-weight: 600;
  margin: 10px 0;
}
.table {
  background-color: #fff;
  border-radius: 10px;
  overflow: hidden;
  margin-top: 10px;
}
.thead {
  background-color: $main_color;
  display: flex;
  color: #fff;
  tr {
    width: 360px;
  }
}
.tbody {
  width: 100%;
  height: 2000px;
  margin-right: 0;
  display: flex;
  tr {
    display: flex;
    flex-wrap: wrap;
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
  margin: 0px 20px;
}
select {
  min-width: 70px;
  height: 45px;
  padding: 0px 10px;
  border: 1px solid $main_color;
}
.titlebox {
  margin: 20px 0px;
}
input {
  width: 80px;
}
.box {
  border: 1px solid $main_color;
  width: 350px;
  height: 300px;
  margin: 10px 5px;
  display: flex;
  .updateShow {
    margin-left: 10px;
    height: 280px;
    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  }
}
.week {
  height: 300px;
  display: flex;
  margin: 10px;
  font-size: 20px;
  font-weight: 700;
}
</style>

