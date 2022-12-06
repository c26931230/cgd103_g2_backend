<template>
    <div class=" back_end_member">
        <h2>訂單管理</h2>
        <!-- 上方篩選區 -->
        <div class="filter_box">
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
                    <th scope="col">訂單明細</th>
                    <th scope="col">訂單金額</th>
                    <th scope="col">訂購人</th>
                    <th scope="col">訂購狀態</th>
                    <th scope="col">留言處理</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(item) in member" class="item" :key="item.id">
                    <th scope="row">{{item.id}}</th> <!-- 編號 -->
                    <td>{{item.name}}</td> <!-- 下單日期 -->
                    <td>
                        <router-link to="/OrderMgntDetail">
                            <button class="subButton">{{item.subscribe}}</button>
                        </router-link>
                    </td> <!-- 訂單明細 -->
                    <td>{{item.mail}}</td> <!-- 訂單金額 -->
                    <td>{{item.tel}}</td> <!-- 訂購人-->
                    <td>{{item.style}}</td> <!-- 訂單狀態 -->
                    <td>{{item.type}}</td> <!-- 留言處理 -->
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
                    id: 12310011,
                    name: "2022-12-31",
                    subscribe: "明細",
                    mail:"$9999",
                    tel:"Jason",
                    style:"未確認",
                    type: "已完成",
                },  {
                    id: 12310011,
                    name: "2022-12-31",
                    subscribe: "明細",
                    mail:"$9999",
                    tel:"Jason",
                    style:"未確認",
                    type: "已完成",
                },  {
                    id: 12310011,
                    name: "2022-12-31",
                    subscribe: "明細",
                    mail:"$9999",
                    tel:"Jason",
                    style:"未確認",
                    type: "已完成",
                },  {
                    id: 12310011,
                    name: "2022-12-31",
                    subscribe: "明細",
                    mail:"$9999",
                    tel:"Jason",
                    style:"未確認",
                    type: "已完成",
                },  {
                    id: 12310011,
                    name: "2022-12-31",
                    subscribe: "明細",
                    mail:"$9999",
                    tel:"Jason",
                    style:"未確認",
                    type: "已完成",
                },  {
                    id: 12310011,
                    name: "2022-12-31",
                    subscribe: "明細",
                    mail:"$9999",
                    tel:"Jason",
                    style:"未確認",
                    type: "已完成",
                },  {
                    id: 12310011,
                    name: "2022-12-31",
                    subscribe: "明細",
                    mail:"$9999",
                    tel:"Jason",
                    style:"未確認",
                    type: "已完成",
                },  {
                    id: 12310011,
                    name: "2022-12-31",
                    subscribe: "明細",
                    mail:"$9999",
                    tel:"Jason",
                    style:"未確認",
                    type: "已完成",
                },  {
                    id: 12310011,
                    name: "2022-12-31",
                    subscribe: "明細",
                    mail:"$9999",
                    tel:"Jason",
                    style:"未確認",
                    type: "已完成",
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