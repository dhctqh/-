
<template>
  <el-container style="height: 100%">
    <img
      :src="imgSrc"
      style="
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        min-width: 1000px;
        z-index: -1;
      "
      alt=" "
    />

    <!-- 表单 -->
    <el-form
      status-icon
      ref="ruleForm"
      label-width="100px"
      class="login-box"
      style="
        border: 1px solid #dcdfe6;
        width: 450px;
        height: 400px;
        margin: 100px auto;
        padding: 60px 50px 130px 30px;
        border-radius: 5px;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        box-shadow: 0 0 25px #909399;
        background-color: white;
      "
    >
      <el-header style="font-size: 50px; margin-bottom: 50px">
        <b>修改信息</b>
      </el-header>
      <el-row :gutter="10" style="margin-top: 5%">
        <div class="header1">
          <el-form
            status-icon
            ref="ruleForm"
            label-width="100px"
            class="demo-ruleForm"
          >
            <el-form-item label="登录ID：" prop="changeId">
              <el-input
                disabled="true"
                v-model="changeId"
                maxLength="30"
                style="width: 300px"
                >{{ changeId }}</el-input
              >
            </el-form-item>
            <el-form-item label="姓名：" prop="changeName">
              <el-input
                v-model="changeName"
                maxLength="20"
                placeholder="请输入姓名"
                style="width: 300px"
              ></el-input>
            </el-form-item>
            <el-form-item label="邮箱：" prop="changeEmail">
              <el-input
                v-model="changeEmail"
                maxLength="30"
                placeholder="请输入邮箱"
                style="width: 300px"
              ></el-input>
            </el-form-item>
            <el-form-item label="修改密码：" prop="changePassword">
              <el-input
                v-model="changePassword"
                maxLength="30"
                placeholder="请输入密码"
                show-password
                style="width: 300px"
              ></el-input>
            </el-form-item>
            <el-form-item label="确认密码：" prop="change2Password">
              <el-input
                v-model="change2Password"
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
            style="text-align: center; margin-bottom: 20px"
          >
            <el-button type="primary" @click="changeInformation"
              >确认</el-button
            >
            <el-button type="primary" @click="$router.push('/Helloworld')"
              >返回</el-button
            >
          </div></el-col
        >
      </el-row>
    </el-form>
  </el-container>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      changeId: "",
      changeName: "",
      changeEmail: "",
      changePassword: "",
      change2Password: "",

      imgSrc: require("../../static/rough.jpg"),
    };
  },
  created() {
    this.changeId = window.sessionStorage.getItem("userId");
    this.changeName = window.sessionStorage.getItem("signedUsername");
    this.changeEmail = window.sessionStorage.getItem("email");
  },
  methods: {
    changeInformation() {
      if (this.changePassword != this.change2Password) {
        alert("密码不一致");
      } else {
        console.log("ssssssssssssssssss");
        console.log(this.changeId);
        console.log(this.$store.state.signedId);
        console.log("ssssssssssssssssss");
        let data = {
          userId: this.changeId,
          name: this.changeName,
          email: this.changeEmail,
          password: this.changePassword,
        };
        axios
          .put("api/user/updateUser", data)
          .then((res) => {
            alert("修改成功");

            this.$router.push("/");
            location.reload();
          })
          .catch((err) => {
            alert("修改失败");
          });
      }

      //  handleEdit(index,row){
      //          this.formSelect=row;
      //          let data = {"userId":this.formSelect.userId,"status":"注销"};
      //         axios.put('api/user/updateUser', data)
      //         .then(res=>{
      //           this.submitForm();
      //          console.log('res=>',res);
      //          }).catch(err => {
      //         console.log(err);
      //        });

      //       },
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

.background {
  position: absolute;
  height: 100%;
  width: 90%;
  z-index: -1;
}
</style>