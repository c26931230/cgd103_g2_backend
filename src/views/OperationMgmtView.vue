<template>
    <!-- 在這邊寫 -->
    <h2>營運管理</h2>
    <div class="wrap">
        <div class="item">
            <router-link to="/SubscriptionMgmt">
                <img src="icon_file.png" alt="">
                <p>本週新增衣服</p>
                <p class="num">6件</p>
                <h3>訂閱服務管理</h3>
            </router-link>
        </div>
        <div class="item">
            <router-link to="/OneweekDressing">
                <img src="icon_file.png" alt="">
                <p>本週新增貼文</p>
                <p class="num">20個</p>
                <h3>一週穿搭管理</h3>
            </router-link>
        </div>
        <div class="item">
            <router-link to="/ClothingMatchMgnt">
                <img src="icon_ootd.png" alt="">
                <p>本週新增造型</p>
                <p class="num">20個</p>
                <h3>服飾搭配管理</h3>
            </router-link>
        </div>
        <div class="item">
            <router-link to="/MemberMgmt">
                <div class="data">
                    <div class="title_box">
                        <h3>會員管理</h3>
                        <p>近期註冊趨勢</p>
                    </div>
                    <div class="num_box">
                        <img src="icon_overline.png" alt="">
                        <p class="num">36人</p>
                    </div>
                    <div class="tag_box">
                        <p class="tag">+10%</p>
                    </div>
                </div>
            </router-link>
        </div>
        <div class="item">
            <router-link to="StaffMgnt">
                <div class="data">
                    <div class="title_box">
                        <h3>員工管理</h3>
                        <p>本週新增員工</p>
                    </div>
                    <div class="num_box">
                        <img src="icon_overline.png" alt="">
                        <p class="num">3人</p>
                    </div>
                    <div class="tag_box">
                        <p class="tag">+10%</p>
                    </div>
                </div>
            </router-link>
        </div>
        <div class="item">
            <router-link to="/CommodityMgnt">
                <div class="title_box">
                    <h3>商品管理</h3>
                    <div class="num_box">
                        <p>本週新增商品<span class="num">20個</span></p>
                    </div>
                </div>
                <div class="img_box">
                    <img src="https://picsum.photos/200/200/?random=10">
                    <img src="https://picsum.photos/200/200/?random=10">
                    <img src="https://picsum.photos/200/200/?random=10">
                </div>
            </router-link>
        </div>
        <!-- <div class="item"></div> -->
    </div>
</template>
<script>
export default {
    name: "OperationMgnt",
};
</script>
<style lang="scss" scoped>
@mixin h3 {
    color: $title_color;
    font-weight: 600;
    font-size: 20px;
}

@mixin group1 {
    img {
        margin-bottom: 10px;
    }

    p {
        color: $text_color;
    }

    .num {
        font-size: 30px;
        font-weight: 600;
        color: $text_color;
    }

    h3 {
        @include h3();
    }
}

@mixin group2 {
    .data{
        display: flex;
    align-items: center;

    .title_box {
        width: 33%;
        h3 {
            @include h3();
        }
        p {
            color: $text_color;
        }
    }
    .num_box {
        width: 33%;
        text-align: center;
        .num {
            font-size: 30px;
            font-weight: 600;
            color: $text_color;
        }
    }
    .tag_box {
        width: 33%;
        p {
            background-color: $main_color;
            color: #fff;
            padding: 5px 20px;
            width: fit-content;
            margin: 0 auto;
        }
    }
    }
}

a {
    text-decoration: none;
    display: block;
}

h2 {
    font-size: 32px;
    color: $main_color;
    font-weight: 600;
    margin: 10px 0;
}

.wrap {
    display: grid;
    grid-template-columns: 33% auto auto 33%;
    grid-template-rows: auto auto auto auto;
    // min-height: 90vh;
    gap: 20px;

    .item {
        border-radius: 5px;
        background-color: #fff;
        padding: 10px 20px;
    }

    .item:nth-child(1) {
        //訂閱服務管理
        grid-area: 1/1/2/2;
        @include group1();
    }

    .item:nth-child(2) {
        //一週穿搭管理
        grid-area: 1/2/2/4;
        @include group1();
    }

    .item:nth-child(3) {
        //服飾搭配管理
        grid-area: 1/4/2/5;
        @include group1();
    }

    .item:nth-child(4) {
        //會員管理
        grid-area: 2/1/3/3;
        @include group2();
    }

    .item:nth-child(5) {
        //員工管理
        grid-area: 3/1/4/3;
        @include group2();
    }

    .item:nth-child(6) {
        //商品管理
        grid-area: 2/3/4/5;

        .title_box {
            h3 {
                display: inline-block;
                @include h3();
                width: 35%;
            }

            .num_box {
                display: inline-block;

                p:nth-child(1) {
                    color: $text_color;
                }

                .num {
                    font-size: 30px;
                    font-weight: 600;
                    color: $text_color;
                    margin-left: 10px;
                }
            }
        }

        .img_box {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-content: center;

            img {
                width: 30%;
            }
        }
    }

    .item:nth-child(7) {
        grid-area: 4/1/5/5;
    }
}
</style>