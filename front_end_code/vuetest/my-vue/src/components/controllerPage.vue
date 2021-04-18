<template>
  <el-container>
    <!-- 头部区域 -->
    <el-header>
      <div>
        <span>事务管理系统</span>
      </div>
      <div class="grid-content">
        <el-row :gutter="10">
          <template>
            <b style="font-size: 25px; margin-top: 50px">
              欢迎！ {{ username }}</b
            >
          </template>
          <el-button
            style="margin: 35px 20px"
            type="primary"
            size="medium"
            @click="$router.push('/')"
            >退出</el-button
          >
          <router-link to="/changePersonalImfornation">
            <el-button size="medium" type="primary"
              >修改个人信息</el-button
            ></router-link
          >
        </el-row>
      </div>
    </el-header>
    <!-- 页面主体区域 -->
    <el-container>
      <!-- 侧边栏 -->
      <el-aside>
        <div class="toggle-button">|||</div>
        <!-- 侧边栏菜单区域 -->
        <el-menu
          background-color="#333744"
          text-color="#fff"
          active-text-color="#409EFF"
          router
        >
          <!-- 一级菜单 -->
          <el-menu-item index="/HelloWorld_xinIssue">
            <!-- 一级菜单的模板区域 -->

            <!-- 图标 -->
            <i class="el-icon-menu"></i>
            <!-- 文本 -->
            <span slot="title">创建新事务</span>
          </el-menu-item>
          <el-menu-item
            index="/Issue_report_form"
            v-if="signedidentity1 == '经理' || signedidentity1 == 'admin'"
          >
            <!-- 一级菜单的模板区域 -->

            <!-- 图标 -->
            <i class="el-icon-menu"></i>
            <!-- 文本 -->
            <span slot="title">事务报表</span>
          </el-menu-item>
          <el-menu-item index="/Account" v-if="signedidentity1 == 'admin'">
            <!-- 一级菜单的模板区域 -->

            <!-- 图标 -->
            <i class="el-icon-menu"></i>
            <!-- 文本 -->
            <span slot="title">账号管理</span>
          </el-menu-item>
          <el-menu-item
            index="/list"
            v-if="
              signedidentity1 == '普通职员' ||
              signedidentity1 == 'admin' ||
              signedidentity1 == '经理'
            "
          >
            <!-- 一级菜单的模板区域 -->

            <!-- 图标 -->
            <i class="el-icon-menu"></i>
            <!-- 文本 -->
            <span slot="title">事务查询</span>
          </el-menu-item>
        </el-menu>
      </el-aside>
      <!-- 右侧内容主体 -->
      <el-main>
        <!-- 路由占位符 -->
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
export default {
  data() {
    return {
      signedidentity1: "",
      username: "",
    };
  },
  created() {
    this.getAuth();
    this.getname();
  },

  methods: {
    getAuth() {
      this.signedidentity1 = this.activePath = window.sessionStorage.getItem(
        "signedidentity1"
      );
      console.log("this.signedidentity1");
      console.log(this.signedidentity1);
      console.log(this.$store.state.signedidentity1);
    },
    getname() {
      this.username = window.sessionStorage.getItem("signedUsername");
    },
  },
};
</script>

<style scoped>
.el-container {
  height: 100%;
}
.el-header {
  background-color: #373d41;
  display: flex;
  justify-content: space-between;
  padding-left: 0;
  align-items: center;
  color: #fff;
  font-size: 20px;
}

.el-header > div {
  display: flex;
  align-items: center;
}
.el-header > div span {
  margin-left: 15px;
}

.el-aside {
  background-color: #333744;
}
.el-aside .el-menu {
  border-right: none;
}
.el-main {
  background-color: #eaedf1;
}

.toggle-button {
  background-color: #4a5064;
  font-size: 10px;
  line-height: 24px;
  color: #fff;
  text-align: center;
  letter-spacing: 0.2em;
  cursor: pointer;
}
</style>
