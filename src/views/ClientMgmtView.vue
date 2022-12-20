<template>
    <div class=" back_end_member">
        <h2>廠商留言</h2>
        <!-- 上方篩選區 -->
        <div class="filter_box">
                
            <input type="text" placeholder="Search">
            <button class="search" @click="search">search</button>   
        </div>
        <!-- 上方篩選區 end -->
        <!-- 會員列表 -->
        <table class="table member_table">
            <thead>
                <tr>
                    <th scope="col">留言時間</th>
                    <th scope="col">email</th>
                    <th scope="col">廠商名稱</th>
                    <th scope="col">留言內容</th>
                    <th scope="col">回覆狀態</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="e in client" class="item" :key="e.client_id">
                    <th scope="row">{{e.clientmes_time}}</th> <!-- 留言時間 -->
                    <td>{{e.client_person}}</td> <!-- email -->
                    <td>{{e.client_phone}}</td> <!-- 廠商名稱 -->
                    <td class="msg" >{{e.client_meg}}</td> <!-- 留言內容 -->
                    <td>{{e.reply}}</td> <!-- 回覆狀態-->
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
        name: "MemberMgmt",
        data() {
            return {
            client: [ //會員資訊
                // {
                //     id: 1,
                //    time: "2022-12-31",
                //     email: "lilt64p93@yahoo.com.tw",
                //     client:"Jason Su",
                //     msg:"我已經電話聯絡你們很多次了但你們都沒有回是怎樣，我老闆很大尾你們最好快點給我回覆，不然等著瞧，小心我把你們業界名聲搞臭。",
                //     reply:"未回覆",
                // }, 
                // {
                //     id: 2,
                //    time: "2022-12-31",
                //     email: "lilt64p93@yahoo.com.tw",
                //     client:"Jason Su",
                //     msg:"您好我是GU的專案經理，希望未來有機會可以合作，如有興趣再請你們這邊回覆我們囉，感謝。",
                //     reply:"未回覆",
                // }, 
            ],	
            search:""
        }},
        methods:{
            getResource() { //取得廠商留言資料
            this.axios.get(`${BASE_URL}/OrderMgnt/getClientMsg.php`).then((response) => {
                console.log(response.data);
                this.employee = response.data;
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
            margin-left: 0;
            padding-left: 0;
            &:hover{
                background-color:rgb(119, 121, 139);
            }
            
        }
        svg{
            margin:14px ;
        }
        input{
            outline: none;
            border: 1px $main_color solid;
            margin: 10px;
            margin-right: 0;
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
    
        td.msg{
            width: 300px;
        }

    button.subButton{
        border-radius:10% ;
        background-color: rgb(100, 100, 163);

    }
        
    </style>