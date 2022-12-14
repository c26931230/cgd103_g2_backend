<template>
    <div class="back_end_employee">
        <div id="lightbox">
            <div id="edit_box">
                <div class="form_item">
                    <label for="title">員工ID</label>
                    <input type="text" id="title">
                </div>
                <div class="form_item">
                    <label for="title">員工姓名</label>
                    <input type="text" id="title">
                </div>
                <div class="form_item">
                    <label for="title">員工身分</label>
                    <input type="text" id="title">
                </div>
                <div class="confirm_box">
                    <button>新增</button>
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
                    <th scope="col">帳號狀態</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="prodRow in prodRows" class="item"  @click="open()">
                    <th scope="row">{{ prodRow.emp_name }}</th> <!-- 員工編號 -->
                    <!-- <td>{{ prodRow.emp_name }}</td> 姓名 -->
                    <!-- <td>{{ prodRow.job }}</td> 職稱 -->
                    <!-- <td>{{ prodRow.state }}</td> 帳號狀態 -->
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
export default {
    name: "StaffMgnt",
    data() {
        return {
            prodRows:[],
            employee: [ //員工資訊
                {
                    emp_id: 1,
                    emp_name: 'jason',
                    emp_job: '造型師',
                    emp_state: '正常',
                },
                {
                    emp_id: 2,
                    emp_name: 'jason',
                    emp_job: '造型師',
                    emp_state: '正常',
                },
                {
                    emp_id: 3,
                    emp_name: 'jason',
                    emp_job: '造型師',
                    emp_state: '正常',
                },
            ],


        }
    },
    methods: {
        // showAll() {
        //     this.axios.get("/api_server/empList.php")
        //         .then((res) => {
        //             console.log(res)
        //         })
        // },
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
        getMember() {
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

            var url = "/api_server/getMore_employee._JSON.php?emp_id=" + document.getElementById("emp_id").value;
            xhr.open("Get", url, true);
            xhr.send(null);
        },
        getProducts(){
            let xhr = new XMLHttpRequest();
            xhr.onload = function(){
                if(xhr.status == 200){
                    this.prodRows = JSON.parse(xhr.responseText);
                    // console.log(xhr.responseText);
                    console.log(this.prodRows);
                }
            }
            xhr.open("Get","/api_server/empList.php",true);
            xhr.send(null)
        }
       

    },
    mounted(){
        this.getProducts();
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
                align-items: flex-start;
                margin-bottom: 10px;

                label {
                    width: 100px;
                    font-size: 20px;
                    font-weight: 900;
                    color: $main_color;
                    line-height: 45px;
                }

                input {
                    width: calc(100% - 100px);
                    font-size: 16px;
                    border: 1px $main_color solid;
                    height: 45px;
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