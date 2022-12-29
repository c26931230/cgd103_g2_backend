// 上線用
export const BASE_URL = 'https://tibamef2e.com/cgd103/g2/back/phpfile'
// 本地端
// export const BASE_URL = 'http://localhost/cgd103_g2_backend/phpfile'
// export const BASE_URL = 'http://localhost:8887/cgd103_g2_backend/phpfile'
// 權限驗證 
export const AUTHENTICATED = (to, from, next) => {
  let emp_job = JSON.parse(sessionStorage.getItem("employee")).job;
  if (emp_job === "員工") {
    next();
  } else {
    next(false);
    alert("權限不足")
  }
}

