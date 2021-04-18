<template>
  <el-container style="overflow: hidden">
    <el-row :gutter="20">
      <el-col :span="24" :offset="10"
        ><div class="grid-content bg-purple">
          <el-card>
            <el-form
              :model="ruleForm"
              :rules="rules"
              ref="ruleForm"
              label-width="100px"
              class="demo-ruleForm"
            >
              <el-form-item prop="title" style="margin: 30px">
                <b style="font-size: 30px; margin-right: 10px">Issue题目</b>
                <el-input
                  v-model="ruleForm.title"
                  placeholder="内容"
                  style="width: 70%; position: relative; bottom: 5px"
                ></el-input>
              </el-form-item>
              <div style="font-size: 30px">
                基本信息<el-divider></el-divider>
              </div>
              <div style="margin: 0 auto">
                <el-row :gutter="20">
                  <el-col :span="6"
                    ><div class="grid-content">
                      <div>
                        <el-form-item label="Issue No" prop="issueId">
                        </el-form-item>
                      </div>
                      <el-input
                        v-model="ruleForm.issueId"
                        disabled=""
                        placeholder="系统自动生成"
                      ></el-input></div
                  ></el-col>
                  <el-col :span="6"
                    ><div class="grid-content">
                      <div>
                        <el-form-item label="创建时间" prop="iCreateTime">
                        </el-form-item>
                      </div>
                      <el-date-picker
                        v-model="ruleForm.iCreateTime"
                        :picker-options="pickerOptions0"
                        type="date"
                        placeholder="系统自动生成"
                        style="width: 100%"
                        disabled=""
                      ></el-date-picker></div
                  ></el-col>

                  <el-col :span="6"
                    ><div class="grid-content">
                      <div>
                        <el-form-item
                          label="实际完成时间"
                          label-width="formLabelWidth"
                          prop="actualTime"
                        >
                        </el-form-item>
                      </div>
                      <el-date-picker
                        v-model="ruleForm.actualTime"
                        :picker-options="pickerOptions0"
                        type="date"
                        placeholder="系统自动生成"
                        style="width: 100%"
                        disabled=""
                      ></el-date-picker></div
                  ></el-col>
                </el-row>
              </div>

              <el-row :gutter="20">
                <el-col :span="6"
                  ><div class="grid-content">
                    <div>
                      <el-form-item label="影响版本" prop="version">
                      </el-form-item>
                    </div>
                    <el-input
                      v-model="ruleForm.version"
                      placeholder=""
                    ></el-input></div
                ></el-col>
                <el-col :span="6"
                  ><div class="grid-content">
                    <el-form-item
                      label="计划修改时间"
                      label-width="120px"
                      prop="planTime"
                      required=""
                    >
                    </el-form-item>

                    <el-date-picker
                      v-model="ruleForm.planTime"
                      :picker-options="pickerOptions0"
                      type="date"
                      placeholder="内容"
                      style="width: 100%"
                    ></el-date-picker></div
                ></el-col>

                <el-col :span="6"
                  ><div class="grid-content">
                    <div>
                      <el-form-item label="Issue类型" prop="type">
                      </el-form-item>
                    </div>
                    <el-select
                      v-model="ruleForm.type"
                      placeholder="内容"
                      style="width: 100%"
                    >
                      <el-option label="前端" value="前端"></el-option>
                      <el-option label="后端" value="后端"></el-option>
                      <el-option label="测试" value="测试"></el-option>
                      <!-- <el-input v-model="ruleForm.type" placeholder=""></el-input>  -->
                    </el-select>
                  </div></el-col
                >
                <el-col :span="6"
                  ><div class="grid-content">
                    <div>
                      <el-form-item label="Issue等级" prop="grade">
                      </el-form-item>
                    </div>
                    <el-select
                      v-model="ruleForm.grade"
                      placeholder="内容"
                      style="width: 100%"
                    >
                      <el-option label="最高" value="a"></el-option>
                      <el-option label="较高" value="b"></el-option>
                      <el-option label="一般" value="c"></el-option>
                      <el-option label="低" value="d"></el-option>
                    </el-select></div
                ></el-col>
              </el-row>
              <el-row :gutter="20">
                <el-col :span="12"
                  ><div class="grid-content">
                    <div>
                      <el-form-item label="重现步骤" prop="step">
                      </el-form-item>
                    </div>
                    <el-input
                      type="textarea"
                      style="width: 150%"
                      :autosize="{ minRows: 6, maxRows: 8 }"
                      v-model="ruleForm.step"
                      placeholder="内容"
                    ></el-input></div
                ></el-col>
              </el-row>

              <el-row :gutter="20" v-if="!$store.state.edit">
                <el-col :span="6"
                  ><div class="grid-content">
                    <div>
                      <el-form-item label="指派修改人" prop="userId2">
                      </el-form-item>
                    </div>
                    <el-input
                      v-model="ruleForm.userId2"
                      placeholder="内容"
                    ></el-input></div
                ></el-col>
              </el-row>

              <!--
<el-row :gutter="20">
<el-col :span="12"><div class="grid-content ">
<div>
<el-form-item label="解决方案" prop="solution">
</el-form-item>
</div>
<el-input type="textarea"
  :autosize="{ minRows: 2, maxRows: 4}" v-model="ruleForm.solution" placeholder="内容"></el-input>
</div></el-col>
</el-row>
-->

              <el-form-item style="text-align: center">
                <el-button type="primary" @click="submitForm('ruleForm')"
                  >提交</el-button
                >
                <el-button type="primary" @click="reset('ruleForm')"
                  >清空</el-button
                >
              </el-form-item>

              <!--
  

<el-form-item style="text-align:center">
    <el-button  type="primary"  @click="submitForm('ruleForm')" round>提交验证</el-button>
</el-form-item>


<el-form-item style="text-align:center">
    <el-button  type="primary"  @click="submitForm('ruleForm')" round>退回修改</el-button>
    <el-button :plain="true"  type="primary"  @click="open1" round>关闭</el-button>

</el-form-item>
-->
            </el-form>
          </el-card>
        </div></el-col
      >
    </el-row>
  </el-container>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      pickerOptions0: {
        disabledDate(time) {
          return time.getTime() < Date.now() - 8.64e7; //如果没有后面的-8.64e7就是不可以选择今天的
        },
      },
      ruleForm: {
        title: "",
        issueId: "",
        iCreateTime: "",
        planTime: "",
        actualTime: "",
        type: "",
        grade: "",
        version: "",
        step: "",
        userId2: "",
        solution: "",
        plan: "",
      },
      imgSrc: require("../../static/winter.jpg"),

      rules: {
        title: [
          { required: true, message: "请输入Issue标题", trigger: "blur" },
          {
            min: 0,
            max: 80,
            message: "长度在 0 到 80 个字符",
            trigger: "blur",
          },
        ],
        //  issueId:[
        //      { required: false, message: '请输入Issue标题', trigger: 'change' }
        //   ],
        //   iCreateTime:[
        //     { type: 'date', required: false, message: '创建时间', trigger: 'change' }
        // ],
        planTime: [
          {
            type: "date",
            required: true,
            message: "请选择日期",
            trigger: "change",
          },
        ],
        //  actualTime:[
        //     { type: 'date', required: false, message: '内容', trigger: 'change' }
        // ],
        type: [
          { required: true, message: "请输入Issue类型", trigger: "blur" },
          {
            min: 0,
            max: 30,
            message: "长度在 0 到 30 个字符",
            trigger: "blur",
          },
        ],
        grade: [
          { required: true, message: "请选择一个Issue等级", trigger: "change" },
        ],
        version: [
          { required: true, message: "请输入影响版本", trigger: "blur" },
          {
            min: 0,
            max: 30,
            message: "长度在 0 到 30 个字符",
            trigger: "blur",
          },
        ],
        step: [
          { required: true, message: "请输入步骤", trigger: "blur" },
          {
            min: 0,
            max: 2000,
            message: "长度在 0 到 2000 个字符",
            trigger: "blur",
          },
        ],
        userId2: [
          { required: true, message: "请指定修改人", trigger: "blur" },
          {
            min: 0,
            max: 30,
            message: "长度在 0 到 30 个字符",
            trigger: "blur",
          },
        ],
        solution: [
          { required: true, message: "请输入解决方案", trigger: "blur" },
          {
            min: 0,
            max: 2000,
            message: "长度在 0 到 2000 个字符",
            trigger: "blur",
          },
        ],
      },
    };
  },
  methods: {
    reset(formName) {
      this.$refs[formName].resetFields();
    },

    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios
            .get("api/user/queryUser", {
              params: { name: this.ruleForm.userId2 },
            })
            .then((res) => {
              console.log("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
              console.log(res);
              console.log("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

              // if(res.data[0].name==this.ruleForm.userId2){

              let data = {
                // 'issueId':this.ruleForm.issueId,
                title: this.ruleForm.title,
                // 'iCreateTime':this.ruleForm.iCreateTime,
                reviser: this.ruleForm.userId2,
                planTime: this.ruleForm.planTime,
                // 'actualTime':this.ruleForm.actualTime,
                type: this.ruleForm.type,
                grade: this.ruleForm.grade,
                version: this.ruleForm.version,
                step: this.ruleForm.step,
                founder: this.$store.state.signedUsername,
                userId1: (this.changeId = window.sessionStorage.getItem(
                  "userId"
                )),
              };
              axios
                .post("api/issue/insertIssue", data)

                .then((res) => {
                  console.log("res=>", res);
                  alert("成功创建issue");
                  this.$refs[formName].resetFields();
                  console.log(data);
                })
                .catch((err) => {
                  console.log(err);
                  alert("创建issue失败");
                });
              // }
              // else
              // {alert("无该用户ID");
              //
              // }
            })
            .catch((err) => {
              alert("无该用户ID");
            });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
  },
};
</script>
<style scoped>
.el-row {
  margin-bottom: 20px;
}
.el-col {
  border-radius: 4px;
}
.-dark {
  background: #f1f3f5;
}

.-light {
  background: #f1f3f5;
}
.grid-content {
  border-radius: 4px;
  min-height: 5px;
}
.row-bg {
  padding: 0 0 0 0;
  background-color: #f1f3f5;
}

.el-form-item__label {
  color: black;
  font-size: 15px;
}

.aaa {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>