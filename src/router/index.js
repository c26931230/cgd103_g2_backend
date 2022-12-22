// Hash 模式
// import { createRouter, createWebHashHistory } from 'vue-router'

// History 模式
import { createRouter, createWebHistory } from 'vue-router'

import { AUTHENTICATED } from "@/assets/js/common.js";
const routes = [
  {
    path: "/", //LOGIN
    name: "LoginView",
    component: () => import("../views/LoginView.vue"),
  },
  {
    path: "/HomeView", //HOME
    name: "HomeView",
    component: () => import("../views/HomeView.vue"),
    children: [
      {
        path: "/OperationMgnt", //營運管理
        name: "OperationMgnt",
        component: () => import("../views/OperationMgmtView.vue"),
        beforeEnter: AUTHENTICATED
        
      },
      {
        path: "/StaffMgnt", //員工管理
        name: "StaffMgnt",
        component: () => import("../views/StaffMgntView.vue"),
        beforeEnter: AUTHENTICATED
      },
      {
        path: "/MemberMgmt",//會員管理
        name: "MemberMgmt",
        component: () => import("../views/MemberMgmtView.vue"),
        beforeEnter: AUTHENTICATED
      },
      {
        path: "/CommodityMgnt", //商城管理
        name: "CommodityMgnt",
        component: () => import("../views/CommodityMgntView.vue"),
        beforeEnter: AUTHENTICATED
      },
      {
        path: "/OrderMgnt",//訂單管理
        name: "OrderMgnt",
        component: () => import("../views/OrderMgntView.vue"),
        beforeEnter: AUTHENTICATED
      },
      {
        path: "/OrderMgntDetail",//訂單管理
        name: "OrderMgntDetail",
        component: () => import("../views/OrderMgntDetailView.vue"),
        beforeEnter: AUTHENTICATED
      },
      {
        path: "/ClientMgmt", //廠商預約管理
        name: "ClientMgmt",
        component: () => import("../views/ClientMgmtView.vue"),
        beforeEnter: AUTHENTICATED
      },
      // ==== 造型師專區 ====
      {
        path: "/ClothingMatchMgnt", //服飾搭配管理(造型師登入後頁面)
        name: "ClothingMatchMgnt",
        component: () => import("../views/ClothingMatchMgntView.vue"),
      },
      {
        path: "/SubscriptionMgmt", //訂閱管理
        name: "SubscriptionMgmt",
        component: () => import("../views/SubscriptionMgmtView.vue"),
      },
      {
        path: "/AppointmentMgnt", //會員預約管理
        name: "AppointmentMgnt",
        component: () => import("../views/AppointmentMgntView.vue"),
      },
      {
        path: "/OneweekDressing",//一周穿搭管理
        name: "OneweekDressing",
        component: () => import("../views/OneweekDressingMgntView.vue"),
      },
    ]
  },
]

// Hash 模式
// const router = createRouter({
//   history: createWebHashHistory(),
//   routes
// })

// History 模式
const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router
