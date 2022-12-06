<template>
    <div class=" back_end_member">
        <h2>廠商留言</h2>
        <!-- 上方篩選區 -->
        <div class="filter_box">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg>          
            <input type="text" placeholder="Search">
        </div>
        <!-- 上方篩選區 end -->
        <!-- 會員列表 -->
        <table class="table member_table">
            <thead>
                <tr>
                    <th scope="col">留言編號</th>
                    <th scope="col">留言時間</th>
                    <th scope="col">email</th>
                    <th scope="col">廠商名稱</th>
                    <th scope="col">留言內容</th>
                    <th scope="col">回覆狀態</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(item) in member" class="item" :key="item.id">
                    <th scope="row">{{item.id}}</th> <!-- 時間 -->
                    <td>{{item.time}}</td> <!-- email -->
                    <td>{{item.email}}</td> <!-- email -->
                    <td>{{item.client}}</td> <!-- 廠商名稱 -->
                    <td class="msg" >{{item.msg}}</td> <!-- 留言內容 -->
                    <td>{{item.reply}}</td> <!-- 回覆狀態-->
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
        export default {
        name: "MemberMgmt",
      data() {
        return {
            member: [ //會員資訊
                {
                    id: 1,
                   time: "2022-12-31",
                    email: "lilt64p93@yahoo.com.tw",
                    client:"Jason Su",
                    msg:"我已經電話聯絡你們很多次了但你們都沒有回是怎樣，我老闆很大尾你們最好快點給我回覆，不然等著瞧，小心我把你們業界名聲搞臭。",
                    reply:"未回覆",
                }, 
                {
                    id: 2,
                   time: "2022-12-31",
                    email: "lilt64p93@yahoo.com.tw",
                    client:"Jason Su",
                    msg:"您好我是GU的專案經理，希望未來有機會可以合作，如有興趣再請你們這邊回覆我們囉，感謝。",
                    reply:"未回覆",
                }, 
                {
                    id: 2,
                   time: "2022-12-31",
                    email: "lilt64p93@yahoo.com.tw",
                    client:"Jason Su",
                    msg:"您好我是GU的專案經理，希望未來有機會可以合作，如有興趣再請你們這邊回覆我們囉，感謝。",
                    reply:"未回覆",
                }, 
                {
                    id: 2,
                   time: "2022-12-31",
                    email: "lilt64p93@yahoo.com.tw",
                    client:"Jason Su",
                    msg:"您好我是GU的專案經理，希望未來有機會可以合作，如有興趣再請你們這邊回覆我們囉，感謝。",
                    reply:"未回覆",
                }, 
                {
                    id: 2,
                   time: "2022-12-31",
                    email: "lilt64p93@yahoo.com.tw",
                    client:"Jason Su",
                    msg:"您好我是GU的專案經理，希望未來有機會可以合作，如有興趣再請你們這邊回覆我們囉，感謝。",
                    reply:"未回覆",
                }, 
            ],	
        }
        },
    };
    </script>
    <style lang="scss">
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
            border-radius: 10%;
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