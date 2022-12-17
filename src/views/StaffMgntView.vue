<template>
    <div class="back_end_employee">
        <!-- 新增員工燈箱區 start -->
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
                        <input type="password" id="emp_pwd" name="emp_pwd">
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
        <!-- 新增員工燈箱區 end -->
        <!-- 編輯員工燈箱區 start -->
        <div id="lightbox1">
            <div id="edit_box1">
                <form id="update_employee" method="post" enctype="multipart/form-data">
                    <div class="form_item">
                        <label for="emp_id1">員工編號</label>
                        <input type="text" id="emp_id1" name="emp_id1" placeholder="請輸入員工編號" @change="show()">
                    </div>
                    <div class="form_item">
                        <label for="emp_name1">員工姓名</label>
                        <input type="text" id="emp_name1" name="emp_name1">
                    </div>
                    <div class="form_item">
                        <label>員工身分</label>
                        <div class="item">
                            <div class="op">
                                <input type="radio" name="job1" value="員工" id="emp_op1">
                                <label for="emp_op1">員工</label>
                            </div>
                            <div class="op">
                                <input type="radio" name="job1" value="造型師" id="stylist_op1">
                                <label for="stylist_op1">造型師</label>
                            </div>
                        </div>
                    </div>
                    <div class="form_item">
                        <label for="hiredate1">到職日期</label>
                        <input type="date" id="hiredate1" name="hiredate1">
                    </div>
                    <div class="form_item">
                        <label for="emp_pwd1">密碼</label>
                        <input type="password" id="emp_pwd1" name="emp_pwd1">
                    </div>
                    <div class="form_item">
                        <label for="emp_mail1">電子郵件</label>
                        <input type="email" id="emp_mail1" name="emp_mail1">
                    </div>
                    <div class="form_item">
                        <label for="">狀態</label>
                        <div class="item">
                            <div class="op">
                                <input type="radio" name="emp_state1" value="1" id="normal1">
                                <label for="normal">在職</label>
                            </div>
                            <div class="op">
                                <input type="radio" name="emp_state1" value="0" id="resign1">
                                <label for="resign">離職</label>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="confirm_box">
                    <button @click="update()" id="update">修改</button>
                    <button id="cancel1" @click="close()">取消</button>
                </div>
            </div>
        </div>
        <!-- 編輯員工燈箱區 end -->
        <h2>員工管理</h2>
        <!-- 上方篩選區 -->
        <div class="filter_box">
            <button>全部</button>
            <button>造型師</button>
            <button>員工</button>
            <input type="text" placeholder="Search" v-model="search">
            <button class="search" >search</button>
            <div id="showPanel"></div>
            <div class="operate_box">
                <button id="update_btn" @click="open_update_box()">修改員工</button>
                <button id="create" @click="open_add_box()">新增員工</button>
            </div>
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
                <tr v-for="e in employee" class="item">
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
import { BASE_URL } from '@/assets/js/commom.js'
export default {
    name: "StaffMgnt",
    data() {
        return {
            employee: [], //員工資訊
            search:""
        }
    },
    methods: {
        open_add_box() { //開啟新增燈箱
            let lightbox = document.querySelector('#lightbox') // 新增燈箱
            lightbox.classList.add('active');
        },
        open_update_box(){ //開啟修改燈箱
            let lightbox1 = document.querySelector('#lightbox1') // 修改燈箱
            lightbox1.classList.add('active');
        },
        close() { //關燈箱
            lightbox.classList.remove('active');  // 關新增燈箱
            lightbox1.classList.remove('active'); // 關修改燈箱
        },
        getResource() { //取得員工資料
            this.axios.get(`${BASE_URL}/StaffMgnt/empList.php`).then((response) => {
                console.log(response.data);
                this.employee = response.data;
            });
        },
        insert() { //新增員工
            let xhr = new XMLHttpRequest();
            xhr.onload = function () {
                let result = JSON.parse(xhr.responseText);
                alert(result.msg);
            }
            xhr.open("post", `${BASE_URL}/StaffMgnt/empInsert.php`, true);
            xhr.send(new FormData(document.getElementById("add_employee")));
            lightbox.classList.remove('active');  // 關新增燈箱
        },
        show() { //change時 show資料
            let xhr = new XMLHttpRequest();
            xhr.onload = function () {
                let empRow = JSON.parse(xhr.responseText);
                document.getElementById("emp_name1").value = empRow.emp_name;
                console.log("job = ", empRow.job);
                if (empRow.job === "員工") {//員工
                    document.getElementById("emp_op1").checked = true;
                } else { //造型師
                    document.getElementById("stylist_op1").checked = true;
                }
                document.getElementById("hiredate1").value = empRow.hiredate;
                document.getElementById("emp_pwd1").value = empRow.emp_pwd;
                document.getElementById("emp_mail1").value = empRow.emp_mail;
                if (empRow.emp_state === 1) { //在職
                    document.getElementById("normal1").checked = true;
                }
                else { //離職
                    document.getElementById("resign1").checked = true;
                }
            }
            let url = `${BASE_URL}/StaffMgnt/getEmp.php?emp_id1=` + document.getElementById("emp_id1").value;
            xhr.open("get", url, true);
            xhr.send(null);
        },
        update() { //修改資料
            let xhr = new XMLHttpRequest();
            xhr.onload = function () {
                console.log(xhr.responseText)
                let result = JSON.parse(xhr.responseText);
                alert(result.msg);
                // $id("btnReset").click();
            }
            xhr.open("post", `${BASE_URL}/StaffMgnt/emp_update.php`, true);
            xhr.send(new FormData(document.getElementById("update_employee")));
            lightbox1.classList.remove('active');  // 關修改燈箱
        }


    },
    mounted() {
        this.getResource();
    },
    computed:{
        employee(){ //搜尋功能
            let cache = this.employee
            if(this.search != ''){
                cache = cache.filter(item=>{
                    let str_id = String(item.emp_id);
                    let up_search = this.search.toLocaleUpperCase();
                    let up_name = item.emp_name.toLocaleUpperCase();
                    return str_id.includes(this.search) || 
                    up_name.includes(up_search) || 
                    item.job.includes(this.search);
                    
                })
            }
            return cache;
        },
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

    #lightbox,
    #lightbox1 {
        position: fixed;
        z-index: 10;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: #00000080;
        display: none;

        #edit_box,
        #edit_box1 {
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

                .item {
                    .op {
                        margin-right: 10px;
                        display: inline-block;

                        label {
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

    #lightbox.active,
    #lightbox1.active {
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
        .operate_box{
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

        // tbody {
        //     .item {
        //         // cursor: pointer;
        //     }
        // }
    }
}
</style>