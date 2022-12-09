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
h2 {
  font-size: 32px;
  color: $main_color;
  font-weight: 600;
  margin: 20px 0;
}
.titlebox {
  margin: 20px 0px;
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
  border: 1px solid gainsboro;
  width: 310px;
  height: 300px;
  display: flex;
  margin: 5px 10px;
  .imageArea {
    width: 85px;
    height: 50px;
  }
  .updateShow {
    width: 200px;
  }
}

table {
  background-color: #fff;
  border-radius: 10px;
  overflow: hidden;
  margin-top: 10px;
  .tbody {
    width: 100%;
    height: 2000px;
    margin-right: 0;
    display: flex;
    tr {
      display: flex;
      flex-wrap: wrap;
      .week {
        height: 300px;
        display: flex;
        margin: 10px;
        font-size: 20px;
        font-weight: 700;
      }
    }
  }

  .filter_box select,
  .filter_box button {
    margin: 0 5px;
  }

  .thead {
    background-color: $main_color;
    display: flex;
    color: #fff;
    tr {
      width: 90px;
      margin-right: 130px;
      th {
        font-weight: 600;
      }
    }
  }
}
</style>

