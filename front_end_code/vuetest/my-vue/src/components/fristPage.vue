
<template>
  <el-container>
    <div class="background">
      <img :src="imgSrc" alt="" />
    </div>
    <el-main style="height: 750px; margin-top: 5%">
      <div
        style="
          border: 1px solid #dcdfe6;
          width: 60%;
          height: 80%;

          margin: 0 auto;
          padding: 25px 35px 40px 35px;
          border-radius: 5px;
          -webkit-border-radius: 5px;
          -moz-border-radius: 5px;
          box-shadow: 0 0 25px #909399;
        "
      >
        <el-header style="font-size: 100px; margin-top: 100px"
          >事务管理系统
        </el-header>

        <!-- <el-button type="primary" size="small" @click="xixi">注册aa</el-button> -->

        <div class="grid-content" style="margin: =0px auto"></div>

        <el-footer style="margin-top: 12%" class="header1">
          <el-row :gutter="10">
            <div class="grid-content" style="margin-top: 100px">
              <router-link to="/register"
                ><el-button
                  type="primary"
                  style="
                    width: 150px;
                    height: 60px;
                    margin-right: 50px;
                    opacity: 0.7;
                    font-size: 30px;
                  "
                  >注册</el-button
                ></router-link
              >
              <router-link to="/sign"
                ><el-button
                  type="primary"
                  style="
                    width: 150px;
                    height: 60px;
                    margin-left: 50px;
                    opacity: 0.7;
                    font-size: 30px;
                  "
                  >登录</el-button
                ></router-link
              >
            </div>
          </el-row>
        </el-footer>
      </div>

      <!-- 表单 -->

      <!-- 表格 -->

      <!-- Issue 列表
  <el-divider></el-divider>
 
 <div class="grid-content " style="margin:0px auto">
  
  
 
   </div> -->
    </el-main>
  </el-container>
</template>

<script>
export default {
  data() {
    return {
      imgSrc: require("../../static/sky.jpg"),
      showEdit: false,
      AA: "0",
    };
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
/* 布局容器样式*/
.el-header,
.el-footer {
  color: #333;
  text-align: center;
  line-height: 60px;
}

.el-aside {
  color: #333;
  text-align: center;
  line-height: 200px;
}

.el-main {
  color: #333;
  text-align: center;
  line-height: 160px;
}

body > .el-container {
  margin-bottom: 40px;
}

.el-container:nth-child(5) .el-aside,
.el-container:nth-child(6) .el-aside {
  line-height: 260px;
}

.el-container:nth-child(7) .el-aside {
  line-height: 320px;
}
/*布局样式*/
.el-col {
  border-radius: 4px;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
/*表单样式*/
/*表格样式*/
/* .el-table .warning-row {
    
  }

  .el-table .success-row {
    
  } */
.buttomInq,
.row,
.header1 {
  display: flex;
  justify-content: center;
  align-items: center;
}

.background {
  position: fixed;
  height: 90%;
  width: 90%;

  z-index: -1;
}
</style>
