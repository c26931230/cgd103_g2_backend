// Hash 模式
// import { createRouter, createWebHashHistory } from 'vue-router'

// History 模式
import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: "/AppointmentMgnt", //諮詢管理
    name: "AppointmentMgnt",
    component: () => import("../views/AppointmentMgntView.vue"),
  },
  {
    path: "/ClothingMatchMgnt", //服飾搭配管理
    name: "ClothingMatchMgnt",
    component: () => import("../views/ClothingMatchMgntView.vue"),
  },
  {
    path: "/", //營運管理(首頁)
    name: "OperationMgnt",
    component: () => import("../views/OperationMgmtView.vue"),
  },
  {
    path: "/ClientMgmt", //廠商預約管理
    name: "ClientMgmt",
    component: () => import("../views/ClientMgmtView.vue"),
  },
  {
    path: "/CommodityMgnt", //商城管理
    name: "CommodityMgnt",
    component: () => import("../views/CommodityMgntView.vue"),
  },
  {
    path: "/MemberMgmt",//會員管理
    name: "MemberMgmt",
    component: () => import("../views/MemberMgmtView.vue"),
  },
  {
    path: "/OneweekDressing",//一周穿搭管理
    name: "OneweekDressing",
    component: () => import("../views/OneweekDressingMgntView.vue"),
  },
  {
    path: "/OrderMgnt",//訂單管理
    name: "OrderMgnt",
    component: () => import("../views/OrderMgntView.vue"),
  },
  {
    path: "/StaffMgnt", //員工管理
    name: "StaffMgnt",
    component: () => import("../views/StaffMgntView.vue"),
  },
  {
    path: "/SubscriptionMgmt", //訂閱管理
    name: "SubscriptionMgmt",
    component: () => import("../views/SubscriptionMgmtView.vue"),
  },
  {
    path: "/OrderMgntDetail",//訂單管理
    name: "OrderMgntDetail",
    component: () => import("../views/OrderMgntDetailView.vue"),
  },
  {
    path: "/OperationMgnt", //營運管理
    name: "OperationMgnt",
    component: () => import("../views/OperationMgmtView.vue"),
  },
  {
    path: "/StaffMgnt", //員工管理
    name: "StaffMgnt",
    component: () => import("../views/StaffMgntView"),
  },
  {
    path: "/SubscriptionMgmt", //訂閱管理
    name: "SubscriptionMgmt",
    component: () => import("../views/SubscriptionMgmtView"),
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
