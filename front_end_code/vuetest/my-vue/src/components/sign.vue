
<template>
  <!-- 表单 -->
  <div>
    <div class="background">
      <img
        :src="imgSrc"
        style="
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          min-width: 1000px;
        "
        alt=" "
      />
    </div>
    <el-header style="font-size: 100px; margin-top: 5%"
      >欢迎使用事务管理系统 ！</el-header
    >

    <el-row :gutter="10" style="margin-top: 5%">
      <div class="header1">
        <el-form
          status-icon
          ref="ruleForm"
          label-width="100px"
          style="
            border: 1px solid #dcdfe6;
            width: 500px;
            height: 350px;
            margin: 0 auto;
            padding: 25px 35px 40px 35px;
            border-radius: 5px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            box-shadow: 0 0 25px #909399;
            background-color: white;
          "
        >
          <h1 class="login-title">欢迎登录</h1>

          <el-form-item
            label="系统ID："
            prop="signId"
            style="margin-left: 50px"
          >
            <el-input
              v-model="signId"
              maxLength="30"
              placeholder="请输入ID"
              style="width: 230px"
            ></el-input>
          </el-form-item>
          <el-form-item
            label="输入密码："
            prop="signPassword"
            style="margin-left: 50px"
          >
            <el-input
              v-model="signPassword"
              minlength="8"
              maxLength="30"
              placeholder="请输入密码"
              style="width: 230px; margin-bottom: 30px"
              show-password
            ></el-input>
          </el-form-item>
          <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24"
            ><div
              class="grid-content bg-purple"
              style="text-align: center; margin-bottom: 20px"
            >
              <el-button
                type="primary"
                @click="getuser"
                style="width: 70px; height: 40px; margin-right: 25px"
                >确认</el-button
              >

              <router-link to="/register"
                ><el-button
                  type="primary"
                  style="width: 70px; height: 40px; margin-left: 35px"
                  >注册</el-button
                ></router-link
              >
            </div></el-col
          >
        </el-form>
      </div>
    </el-row>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      signPassword: "",
      signId: "",
      imgSrc: require("../../static/rough.jpg"),
    };
  },
  methods: {
    getuser() {
      var patt1 = new RegExp(
        "^(?![A-Za-z0-9]+$)(?![a-z0-9\\W]+$)(?![A-Za-z\\W]+$)(?![A-Z0-9\\W]+$)[a-zA-Z0-9\\W]{8,}$"
      );
      if (patt1.test(this.signPassword)) {
        axios
          .get("/api/user/queryUser?name=", {
            params: {
              userId: this.signId,
            },
          })
          .then((res) => {
            // console.log('ssss');

            if (res.data[0].password == this.signPassword) {
              if (res.data[0].status == "激活") {
                alert("登录成功");
                var username1 = res.data[0].name;

                var identity1 = res.data[0].identity;
                var signid1 = res.data[0].userId;
                console.log("登录zzzzzzzzzzz");
                console.log(res.data[0].userId);
                console.log(res.data[0].name);
                console.log("登录zzzzzzzzzzz");

                console.log(identity1);

                this.$store.commit("sign", { username1, signid1 });
                window.sessionStorage.setItem(
                  "signedUsername",
                  this.$store.state.signedUsername
                );
                window.sessionStorage.setItem("userId", signid1);
                window.sessionStorage.setItem("email", res.data[0].email);
                console.log("storezzzzzzzzzzz");
                console.log(this.$store.state.signId);

                console.log("storezzzzzzzzzzz");

                // var identity1=res.date[0].identity;
                this.$store.commit("body", identity1);

                this.$router.push("/Helloworld");
                window.sessionStorage.setItem(
                  "signedidentity1",
                  this.$store.state.signedidentity1
                );
              } else {
                alert("账号未激活 ");
              }
            } else {
              alert("登录失败");
            }
          })
          .catch((err) => {
            alert("用户不存在或密码错误");
          });
      } else {
        alert(
          "密码格式错误，密码格式：不少于8位，必须包含大小写字母以及特殊符号"
        );
      }
    },
  },
};
</script>

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

.header1 {
  display: flex;
  justify-content: center;
  align-items: center;
}
.login-title {
  text-align: center;
  margin: 40px auto 50px auto;
  color: #303133;
}
.background {
  position: absolute;
  height: 100%;
  width: 90%;
  z-index: -1;
}

.el-form-item__label {
  color: black;
}
</style>