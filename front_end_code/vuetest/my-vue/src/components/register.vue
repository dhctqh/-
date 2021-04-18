
<template>
  <!-- 表单 -->
  <div style="">
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
    <el-form
      status-icon
      ref="ruleForm"
      label-width="100px"
      class="login-box"
      style="
        border: 1px solid #dcdfe6;
        width: 450px;
        height: 400px;
        margin: 70px auto;
        padding: 25px 50px 150px 30px;
        border-radius: 5px;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        box-shadow: 0 0 25px #909399;
        background-color: white;
      "
    >
      <h1 class="login-title">账号注册</h1>
      <el-row :gutter="10" style="margin-top: 5%">
        <div class="header1">
          <el-form
            status-icon
            ref="ruleForm"
            label-width="100px"
            class="demo-ruleForm"
          >
            <el-form-item label="系统ID：" prop="signId">
              <el-input
                v-model="saveId"
                maxLength="30"
                placeholder="请输入ID"
                style="width: 300px"
              ></el-input>
            </el-form-item>
            <el-form-item label="姓名：" prop="saveName">
              <el-input
                v-model="saveName"
                maxLength="20"
                placeholder="请输入姓名"
                style="width: 300px"
              ></el-input>
            </el-form-item>
            <el-form-item label="邮箱：" prop="saveEmail">
              <el-input
                v-model="saveEmail"
                maxLength="30"
                placeholder="请输入邮箱"
                style="width: 300px"
              ></el-input>
            </el-form-item>
            <el-form-item label="输入密码：" prop="savePassword">
              <el-input
                v-model="savePassword"
                maxLength="30"
                placeholder="请输入密码"
                show-password
                style="width: 300px"
              ></el-input>
            </el-form-item>
            <el-form-item label="确认密码：" prop="save2Password">
              <el-input
                v-model="save2Password"
                maxLength="30"
                placeholder="请确认密码"
                show-password
                style="width: 300px"
              ></el-input>
            </el-form-item>
          </el-form>
        </div>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24"
          ><div
            class="grid-content bg-purple"
            style="text-align: center; margin: 30px 0px"
          >
            <el-button
              type="primary"
              @click="postuser"
              style="margin-right: 30px"
              >确认</el-button
            >
            <el-button type="primary" @click="$router.push('/')"
              >返回</el-button
            >
          </div></el-col
        >
      </el-row>
    </el-form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      input: "",
      saveId: "",
      saveName: "",
      saveEmail: "",
      savePassword: "",
      save2Password: "",
      imgSrc: require("../../static/rough.jpg"),
    };
  },
  methods: {
    postuser() {
      var patt1 = new RegExp(
        "^(?![A-Za-z0-9]+$)(?![a-z0-9\\W]+$)(?![A-Za-z\\W]+$)(?![A-Z0-9\\W]+$)[a-zA-Z0-9\\W]{8,}$"
      );
      if (patt1.test(this.savePassword)) {
        if (this.savePassword != this.save2Password) {
          alert("确定密码不一致");
        } else {
          let data = {
            userId: this.saveId,
            password: this.savePassword,
            name: this.saveName,
            email: this.saveEmail,
          };
          axios
            .post("api/user/register", data)
            .then((res) => {
              console.log("res=>", res);
              alert("注册成功");
              this.$router.push("/");
            })
            .catch((err) => {
              console.log(err);
              alert("注册失败");
            });
        }
      } else {
        alert("密码格式错误");
      }
    },
  },
};
</script>

<style scoped>
/* .login-box {
   
  
    
    
  } */
.login-title {
  text-align: center;
  margin: 40px auto 50px auto;
  color: #303133;
}
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

.background {
  position: absolute;
  height: 100%;
  width: 100%;

  z-index: -1;
}
.el-form-item__label {
  color: black;
  font-size: 15px;
}
</style>