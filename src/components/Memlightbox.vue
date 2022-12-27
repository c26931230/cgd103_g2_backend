<template>
    <div id="lightbox">
        <div id="edit_box" class="col-9">
            <div class="item">
                <h3>會員資料</h3>
            </div>
            <table class="table">
                <tbody>
                    <tr>
                        <td rowspan="3" colspan="2" class="col-3 picbox">
                            <img
                                :src="`./pic/${data.mem_pic}`"
                                v-if="data.mem_pic"
                            />
                            <p v-else>未新增圖片</p>
                        </td>
                        <th scope="row">姓名</th>
                        <td>{{ data.mem_name }}</td>
                        <th scope="row">性別</th>
                        <td v-if="data.sex == 1">男</td>
                        <td v-else>女</td>
                        <th scope="row">信箱</th>
                        <td>{{ data.mem_mail }}</td>
                    </tr>

                    <tr>
                        <th scope="row">電話</th>
                        <td>{{ data.phone }}</td>
                        <th scope="row">生日</th>
                        <td>{{ data.bday }}</td>
                        <th scope="row">地址</th>
                        <td>@{{ data.address }}</td>
                    </tr>
                    <tr>
                        <th scope="row">身形</th>
                        <td>{{ data.body_shape }}</td>
                        <th scope="row">風格</th>
                        <td>{{ data.style_name }}</td>
                        <!-- <td>AAAAA</td>
                        <td>@fat</td> -->
                    </tr>

                    <tr>
                        <th scope="row" class="col-1">會員編號</th>
                        <td>{{ data.mem_id }}</td>

                        <th scope="row">胸圍</th>
                        <td>{{ data.chest }}</td>
                        <th scope="row">肩寬</th>
                        <td>{{ data.shoulder }}</td>
                        <th scope="row">腰圍</th>
                        <td>{{ data.waistline }}</td>
                    </tr>
                    <tr>
                        <th scope="row">入會日期</th>
                        <td>{{ data.mem_date }}</td>

                        <th scope="row">臀圍</th>
                        <td>{{ data.hip }}</td>
                        <th scope="row">衣長</th>
                        <td>{{ data.clothes }}</td>
                        <th scope="row">褲長</th>
                        <td>{{ data.pants }}</td>
                    </tr>
                    <tr>
                        <th scope="row">訂閱日期</th>
                        <td>{{ data.sub_time }}</td>

                        <th scope="row">到期日</th>
                        <td>{{ data.sub_deadline }}</td>
                        <th scope="row">訂閱金額</th>
                        <td>{{ data.sub_paid }}</td>
                        <!-- <th scope="row">等級編號</th>
                        <td>AAAAA</td> -->
                    </tr>
                </tbody>
            </table>
            <div class="d-flex justify-content-center">
                <button id="cancel" class="btn_ms" @click="close()">
                    關閉
                </button>
            </div>
        </div>
    </div>
</template> 
    <script>
export default {
    props: {
        data: {
            Object,
            default: {
                order_id: null,
                mem_id: 101,
                level_id: 101,
                sub_time: "2022-12-26 15:36:48",
                sub_deadline: "2023-01-26 15:36:48",
                sub_paid: 899,
                mem_name: "林曉晴",
                sex: 1,
                bday: "2000-02-16",
                mem_pic: null,
                phone: "0933456456",
                mem_mail: "qw4898@gmail.com",
                address: "桃園市中壢區復興路1號1樓",
                body_id: 102,
                style_id: 102,
                mem_date: "2022-12-26",
                chest: 33,
                shoulder: 40,
                waistline: 60,
                hip: 80,
                clothes: 57,
                pants: 89,
                shoesize: 37,
                height: 150,
                weight: 45,
                style_name: "文青風",
                style_pic: "hipster2-1.png",
                body_shape: "矩型",
            },
        },
    },
    data() {
        return {};
    },
    methods: {
        close() {
            this.$emit("close");
        },
    },
};
</script>
<style lang="scss" scoped>
.picbox {
    width: 150px;
    height: 150px;
    img {
        width: 150px;
        height: 150px;
        object-fit: contain;
    }
}
#lightbox {
    position: fixed;
    z-index: 10;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #00000080;
    display: flex;
    justify-content: center;
    align-items: center;

    #edit_box {
        min-height: 60%;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        background-color: #fff;
        box-shadow: #00000010 0 0 20px 0px;

        h3 {
            color: $main_color;
            font-weight: 600;
        }
        p {
            font-size: 16px;
        }
    }
}
</style>