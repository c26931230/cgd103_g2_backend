<template>
    <div class=" back_end_member">
        <h2>訂單管理</h2>
        <!-- 上方篩選區 -->
        <div class="filter_box"><!-- 考慮修改成select -->
            <button class="icon_box">全部</button>
            <button class="icon_box">未確認</button>
            <button class="icon_box">備貨中</button>
            <button class="icon_box">已出貨</button>
            <button class="icon_box">留言未回覆</button>
            <button class="icon_box">留言處理中</button>
            <button class="icon_box">留言已完成</button>
        </div>
        <!-- 上方篩選區 end -->
        <!-- 會員列表 -->
        <table class="table member_table">
            <thead>
                <tr>
                    <th scope="col">訂單編號</th>
                    <th scope="col">下單日期</th>
                    <th scope="col">訂單金額</th>
                    <th scope="col">訂購人</th>
                    <th scope="col">物流狀態</th>
                </tr>
            </thead>
            <tbody>
                    <tr v-for="e in orders" class="item" :key="e.order_id">
                        <th scope="row">{{e.order_id}}</th> <!-- 編號 -->   
                    <!-- <router-link to="/OrderMgntDetail">

                    </router-link> -->
                        <td>{{e.order_time}}</td> <!-- 下單日期 -->
                        <td>{{e.total}}</td> <!-- 訂單金額 -->
                        <td>{{e.ord_mem}}</td> <!-- 訂購人-->
                        <td>{{e.order_con}}</td> <!-- 訂單狀態 -->
                    </tr>

            </tbody>
        </table>
        <!-- 會員列表 end -->
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
        import { BASE_URL } from '@/assets/js/commom.js'
        export default {
        name: "OrderMgmt",
        data() {
            return {
                orders: [ //訂單資訊
                ],	
            }
            },
        methods:{
            getResource() { //取得廠商留言資料
            this.axios.get(`${BASE_URL}/OrderMgnt/getOrd.php`).then((response) => {
                console.log(response.data);
                this.orders = response.data;
            });
        },
        },
        mounted() {
            this.getResource();
    },
    };
    </script>
    <style lang="scss" scoped>
    $main_color: #495bff;

    router-link{
        list-style: none;
    }

    .back_end_member{
        box-sizing: border-box;
         // 會員列表-上方篩選區
         .filter_box{
            display: flex;
            align-items: stretch;
        }
        button{
            min-width: 70px;
            outline: none;
            border: none;
            background-color: $main_color;
            color: #fff;
            height: 45px;
            padding: 0px 10px;
            margin:10px;
            &:hover{
                background-color:rgb(119, 121, 139);
            }
            
        }
        input{
            outline: none;
            border: 1px $main_color solid;
        }
        h2{
            font-weight: 600;
            color: $main_color;
            // padding: 10px;
            margin: 10px 0;
        }
         // 會員列表
         .member_table{
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            margin-top: 50px;
            
            }
            thead{
                background-color: $main_color;
                color: #fff;
                tr{
                   
                    th{
                        font-weight: 600; // 表頭 

                   }
                } 
            }
            tbody{
                .item{
                    cursor: pointer;
                }
            }
        }
    

    button.subButton{
        border-radius:10% ;
        background-color: rgb(100, 100, 163);

    }
        
    </style>