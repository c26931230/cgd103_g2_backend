<template>
    <!-- 在這邊寫 -->
    <h2>營運管理</h2>
    <div class="wrap">
        <!-- 年營收 -->
        <div class="item">
            <div class="content_box">
                <h3>本年營收</h3>
                <p>${{year_revenue_data}}</p>
            </div>
        </div>
        <!-- 廠商預約 -->
        <div class="item">
            <div class="content_box">
                <h3>廠商預約</h3>
                <p>未處理<span>{{client_reply}}</span>件</p>
            </div>
        </div>
        <!-- 會員註冊 -->
        <div class="item">
            <h3>會員註冊趨勢</h3>
            <canvas id="chart1"></canvas>
        </div>
        <!-- 收入趨勢 -->
        <div class="item">
            <h3>收入趨勢</h3>
            <!-- {{ employee }} -->
            <canvas id="chart2"></canvas>
        </div>
        <!-- 會員訂閱 -->
        <div class="item">
            <h3>會員訂閱</h3>
            <canvas id="chart3"></canvas>
        </div>
    </div>
</template>
<script>
import Chart from 'chart.js';
//引入BASE_URL參數
import { BASE_URL } from '@/assets/js/common.js'
export default {
    name: "OperationMgnt",
    data() {
        return {
            mem_reg_m: "",//男會員註冊趨勢 12個月
            mem_reg_f: "",//女會員註冊趨勢 12個月
            mem_reg_sum: "",//會員總註冊趨勢
            mem_level: "",//會員訂閱等級比
            revenue_data:"",//營業額
            month:['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
            year_revenue_data:"",
            client_reply:""

        }
    },
    methods: {
        getResource() {
            //取得會員總註冊資料
            this.axios.get(`${BASE_URL}/OperationMgmt/get_mem_sum.php`).then((response) => {
                // console.log("response.data: ", response.data);
                this.mem_reg_sum = response.data;
                this.get_mem_data();

            });
            //取得男會員註冊資料
            this.axios.get(`${BASE_URL}/OperationMgmt/get_mem_m.php`).then((response) => {
                this.mem_reg_m = response.data;
                this.get_mem_data();

            });
            //取得女會員註冊資料
            this.axios.get(`${BASE_URL}/OperationMgmt/get_mem_f.php`).then((response) => {
                this.mem_reg_f = response.data;
                this.get_mem_data();

            });
            // 會員訂閱等級比
            this.axios.get(`${BASE_URL}/OperationMgmt/get_mem_level.php`).then((response) => {
                // console.log("mem_level: ", response.data);
                this.mem_level = response.data;
                this.get_mem_data();
            });
            // 月營收
            this.axios.get(`${BASE_URL}/OperationMgmt/get_revenue.php`).then((response) => {
                // console.log("mem_level: ", response.data);
                this.revenue_data = response.data;
                this.get_mem_data();
            });
            // 年營收
            this.axios.get(`${BASE_URL}/OperationMgmt/get_year_revenue.php`).then((response) => {
                // console.log(response.data.year_rev);
                this.year_revenue_data = response.data.year_rev;

            });
            // 廠商未回覆
            this.axios.get(`${BASE_URL}/OperationMgmt/get_client_reply.php`).then((response) => {
                console.log("client",response.data);
                this.client_reply = response.data.reply;

            });
        },
        get_mem_data() {
            // 會員註冊趨勢 start
            const ctx1 = document.getElementById('chart1').getContext('2d');
            const data1 = {
                labels: this.month,
                datasets: [
                    {
                        data: this.mem_reg_sum,
                        label: "Total",
                        borderColor: "#54B435",
                        borderWidth: 2,
                        type: 'line',
                        fill: false
                    },
                    {
                        label: '男',
                        data: this.mem_reg_m,
                        backgroundColor: '#36A2EB',
                    },
                    {
                        label: '女',
                        data: this.mem_reg_f,
                        backgroundColor: '#FFCD56',
                    },
                ]
            };

            new Chart(ctx1, {
                type: 'bar',
                data: data1
            });
            // 會員註冊趨勢 end
             // // 月營收 曲線 start
            const ctx3 = document.getElementById('chart2').getContext('2d');

            const data3 = {
                labels: this.month,
                datasets: [{
                    label: '每月營收',
                    data: this.revenue_data,
                    // backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: '#54B435',
                    borderWidth: 1,
                    fill:false,
                }]
            };

            const chart3 = new Chart(ctx3, {
                type: 'line',
                data: data3
            });

            // 會員訂閱等級比 start
            const ctx2 = document.getElementById('chart3').getContext('2d');
            const data2 = {
                labels: ['無訂閱', 'BASIC', 'STANDARD', 'ULTRA'],
                datasets: [
                    {
                        data: this.mem_level,
                        label: "Total",
                        backgroundColor: ['#54B435', '#36A2EB', '#FFCD56', 'rgb(255,99,132)'],
                    },
                ]
            };

            new Chart(ctx2, {
                type: 'pie',
                data: data2
            });
            // 會員訂閱等級比 end
           
        }
    },
    mounted() {
        this.getResource();
    },

}

</script>
<style lang="scss" scoped>
h2 {
    font-size: 32px;
    color: $main_color;
    font-weight: 600;
    margin: 10px 0;
}

.wrap {
    display: grid;
    grid-template-columns: 30% 20% 50%;
    grid-template-rows: 150px 150px 400px;
    gap: 10px;
    // width: 98%;
    margin-right: 30px;

    .item {
        background-color: #fff;
        border-radius: 5px;
        border: 1px solid #ddd;
        // max-height: 300px;
        padding: 10px;
        position: relative;

        h3 {
            color: $title_color;
            font-weight: 600;
            font-size: 20px;
            text-align: center;
        }

        .content_box {
            margin: auto;
            position: absolute;
            transform: translate(-50%, -50%);
            top: 50%;
            left: 50%;
        }
    }

    // 年營收
    .item:nth-child(1) {
        grid-area: 1/1/2/2;

        p {
            text-align: center;
            font-size: 40px;
            font-weight: 600;
            color: $main_color;
        }
    }

    // 廠商預約
    .item:nth-child(2) {
        grid-area: 2/1/3/2;

        p {
            font-size: 20px;

            span {
                font-size: 40px;
                padding: 10px;
                font-weight: 600;
                color: $main_color;
            }
        }

    }

    // 會員註冊
    .item:nth-child(3) {
        grid-area: 1/2/3/4;

        #chart1 {
            height: 90% !important;
            width: auto !important;
            margin: auto;
        }
    }

    // 收入趨勢
    .item:nth-child(4) {
        grid-area: 3/1/4/3;
         #chart2 {
            height: 70% !important;
            width: auto !important;
            margin: auto;
        }
    }

    // 會員訂閱
    .item:nth-child(5) {
        grid-area: 3/3/4/4;
         #chart3 {
            height: 80% !important;
            width: auto !important;
            margin: auto;
        }
    }
}
</style>