<template>
    <div class="back_end_employee">
        <div id="lightbox">
            <div id="edit_box">
                <form id="add_employee" method="post" enctype="multipart/form-data">
                    <div class="form_item">
                        <label for="emp_name">員工姓名</label>
                        <input type="text" id="emp_name" name="emp_name">
                    </div>
                    <div class="form_item">
                        <label>員工身分</label>
                        <div class="item">
                            <div class="op">
                                <input type="radio" name="job" value="員工" id="emp_op">
                                <label for="emp_op">員工</label>
                            </div>
                            <div class="op">
                                <input type="radio" name="job" value="造型師" id="stylist_op">
                                <label for="stylist_op">造型師</label>
                            </div>
                        </div>
                    </div>
                    <div class="form_item">
                        <label for="hiredate">到職日期</label>
                        <input type="date" id="hiredate" name="hiredate">
                    </div>
                    <div class="form_item">
                        <label for="emp_pwd">密碼</label>
                        <input type="text" id="emp_pwd" name="emp_pwd">
                    </div>
                    <div class="form_item">
                        <label for="emp_mail">電子郵件</label>
                        <input type="email" id="emp_mail" name="emp_mail">
                    </div>
                    <div class="form_item">
                        <label for="">狀態</label>
                        <div class="item">
                            <div class="op">
                                <input type="radio" name="emp_state" value="1" id="normal">
                                <label for="normal">在職</label>
                            </div>
                            <div class="op">
                                <input type="radio" name="emp_state" value="0" id="resign">
                                <label for="resign">離職</label>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="confirm_box">
                    <button @click="insert()">確認</button>
                    <button id="cancel" @click="close()">取消</button>
                </div>
            </div>
        </div>
        <!-- 新增編輯員工燈箱區 end -->
        <h2>員工管理</h2>
        <!-- 上方篩選區 -->
        <div class="filter_box">
            <button>全部</button>
            <button>造型師</button>
            <button>員工</button>
            <input type="text" placeholder="Search" id="emp_id">
            <button class="search" @click="getMember()">search</button>
            <div id="showPanel"></div>
            <button id="create" @click="open()">新增員工</button>
        </div>
        <!-- 上方篩選區 end -->
        <!-- 員工列表 -->
        <table class="table employee_table">
            <thead>
                <tr>
                    <th scope="col">員工編號</th>
                    <th scope="col">姓名</th>
                    <th scope="col">職稱</th>
                    <th scope="col">到職日</th>
                    <th scope="col">mail</th>
                    <th scope="col">帳號狀態</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="e in employee"  :key="e" class="item"  @click="open()">
                    <th scope="row">{{ e.emp_id }}</th> <!-- 員工編號 -->
                    <td>{{ e.emp_name }}</td> <!-- 姓名 -->
                    <td>{{ e.job }}</td> <!-- 職稱 -->
                    <td>{{ e.hiredate }}</td> <!-- 職稱 -->
                    <td>{{ e.emp_mail }}</td> <!-- mail -->
                    <td>{{ e.emp_state }}</td> <!-- 帳號狀態 -->
                </tr>
            </tbody>
        </table>
        <!-- 員工列表 end -->
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
//引入BASE_URL參數
import {BASE_URL} from '@/assets/js/commom.js'
export default {
    name: "StaffMgnt",
    data() {
        return {
            employee:[], //員工資訊
        }
    },
    methods: {
        open() {
            let lightbox = document.querySelector('#lightbox') // 燈箱
            lightbox.classList.add('active');
            const items = document.querySelectorAll('.item'); // 員工個人資料項目
            items.forEach(item => {	//點擊員工個人資料項目開燈箱
                item.addEventListener('click', e => {
                    lightbox.classList.add('active');
                })
            })
        },
        close() { //關燈箱
            lightbox.classList.remove('active');
        },
        getMember() { //search
            var xhr = new XMLHttpRequest();
            xhr.onload = function () {
                if (xhr.status == 200) {
                    // this.showMember(xhr.responseText);
                    // console.log(xhr.responseText);
                    let employee = JSON.parse(xhr.responseText);
                    console.log("JSON,parse:", employee)
                    let html;
                    if (employee.emp_id) {
                        html = `<table class="memTable">
                        <tr>
                            <th>帳號<td>${employee.emp_id}</td></th>
                        </tr>
                        <tr>
                            <th>姓名<td>${employee.emp_name}</td></th>
                        </tr>
                        <tr>
                            <th><td>${employee.job}</td></th>
                        </tr>
                        <tr>
                            <th>到職日<td>${employee.hiredate}</td></th>
                        </tr>
                    </table>`
                    } else {
                        html = "<p>無此會員資料</p>"
                    }
                    document.getElementById("showPanel").innerHTML = html;

                } else {
                    alert(xhr.status);
                }
            }

            var url = "http://localhost:8887/cgd103_g2_backend/phpfile/empList.php/getMore_employee._JSON.php?emp_id=" + document.getElementById("emp_id").value;
            xhr.open("Get", url, true);
            xhr.send(null);
        },
        getResource() { //取得員工資料
            this.axios.get(`http://localhost:8887/cgd103_g2_backend/phpfile/empList.php`).then((response) => {
                console.log(response.data);
                this.employee = response.data;
            });
        },
        insert(){ //新增員工
            let xhr = new XMLHttpRequest();
                xhr.onload = function(){
                    let result = JSON.parse(xhr.responseText);
                    alert(result.msg);
                }
                xhr.open("post",`http://localhost:8887/cgd103_g2_backend/phpfile/empInsert.php`,true);
                xhr.send(new FormData(document.getElementById("add_employee")));
        }
       

    },
    mounted(){
        this.getResource();
        
    }

};
</script>
<style lang="scss" scoped>
.back_end_employee {
    box-sizing: border-box;

    select {
        width: 80px;
        font-size: 16px;
        border: 1px $main_color solid;
        height: 45px;
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

    input {
        outline: none;
        border: 1px $main_color solid;
    }

    #lightbox {
        position: fixed;
        z-index: 10;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: #00000080;
        display: none;

        #edit_box {
            width: 640px;
            min-height: 300px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: #00000010 0 0 20px 0px;

            .form_item {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
               

                label {
                    width: 100px;
                    font-size: 20px;
                    font-weight: 900;
                    color: $main_color;
                    line-height: 45px;
                }

                input:not([type="radio"]) {
                    width: calc(100% - 100px);
                    font-size: 16px;
                    border: 1px $main_color solid;
                    height: 45px;
                }
                .item{
                    .op{
                        margin-right: 10px;
                        display: inline-block;
                        label{
                            color: $text_color;
                            font-size: 16px;
                            width: fit-content;
                            font-weight: normal;
                        }
                    }
                }
            }
           
        }
    }

    #lightbox.active {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .confirm_box {
        margin-top: 20px;
        text-align: center;

        button {
            margin: 0 5px;
        }
    }

    // 員工列表-上方篩選區
    .filter_box {
        display: flex;
        align-items: stretch;
        position: relative;

        button {
            margin: 0 5px;
        }

        #create {
            margin-left: auto;
        }

        .search {
            margin: 0;
        }
    }
    h2 {
        font-weight: 600;
        color: $main_color;
        padding: 10px;
    }

    /* 員工列表 */
    .employee_table {
        background-color: #fff;
        border-radius: 10px;
        overflow: hidden;
        margin-top: 50px;

        thead {
            background-color: $main_color;
            color: #fff;

            tr {
                th {
                    font-weight: 600; // 表頭 
                }
            }
        }

        tbody {
            .item {
                cursor: pointer;
            }
        }
    }
}
</style>