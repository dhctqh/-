<template>
  <el-container>
    <el-row :gutter="20">
      <el-col :span="24" :offset="10"
        ><div class="grid-content bg-purple">
          <el-card style="margin-bottom: 20px">
            <el-form
              :model="ruleForm"
              :rules="rules"
              ref="ruleForm"
              label-width="100px"
              class="demo-ruleForm"
              :disabled="$store.state.formdisable"
            >
              <el-form-item prop="title" style="margin: 50px">
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

              <el-row :gutter="20" v-if="$store.state.selected">
                <el-col :span="6"
                  ><div class="grid-content">
                    <div>
                      <el-form-item label="解决方案" prop="userId2">
                      </el-form-item>
                    </div>
                    <el-input
                      type="textarea"
                      :autosize="{ minRows: 6, maxRows: 8 }"
                      v-model="ruleForm.plan"
                      placeholder="内容"
                      style="width: 315%"
                    ></el-input></div
                ></el-col>
              </el-row>

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
            <div style="text-align: center; margin: 30px">
              <el-button
                type="primary"
                v-if="$store.state.edit"
                @click="submitValidation"
                round
                >提交验证</el-button
              >
              <el-button
                type="primary"
                v-if="$store.state.founder"
                @click="modifyIssue"
                round
                >退回修改</el-button
              >
              <el-button
                type="primary"
                v-if="$store.state.founder"
                @click="returnlist"
                round
                >关闭</el-button
              >
              <el-button
                type="primary"
                v-if="!$store.state.submit"
                @click="toreturn"
                round
                >返回</el-button
              >
            </div>
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
        title: this.$store.state.title,
        issueId: this.$store.state.issueId,
        iCreateTime: this.$store.state.iCreateTime,
        planTime: this.$store.state.planTime,
        actualTime: this.$store.state.actualTime,
        type: this.$store.state.type,
        grade: this.$store.state.grade,
        version: this.$store.state.version,
        step: this.$store.state.step,
        userId2: this.$store.state.reviser,
        solution: this.$store.state.solution,
        plan: this.$store.state.plan,
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
    toreturn() {
      this.$router.push("/list");
      this.$store.commit("toreturn");
    },
    submitValidation() {
      let data = {
        issueId: this.ruleForm.issueId,
        issueStatus: "待验证",
        plan: this.ruleForm.plan,
        title: this.ruleForm.title,
        grade: this.ruleForm.grade,
        version: this.ruleForm.version,
        step: this.ruleForm.step,
        planTime: this.ruleForm.planTime,
      };
      //  "version":this.ruleForm.version,"planTime":this.ruleForm.planTime,"step":this.ruleForm.step};

      //  let data={"issueId":this.$store.state.issueId,"issueStatus":"待验证","title":this.$store.state.title,"founder":this.$store.state.founder,"iCreateTime":this.$store.state.iCreateTime,"reviser":this.$store.state.reviser,"planTime":this.$store.state.planTime,"actualTime":this.$store.state.actualTime,"userId1":this.$store.state.userId1,"userId2":this.$store.state.userId2,"type":this.$store.state.type,"grade":this.$store.state.grade,"version":this.$store.state.version,"step":this.$store.state.step,"plan":this.$store.state.plan};
      axios
        .put("api/issue/updateIssue", data)
        .then((res) => {
          alert("提交成功");
          this.$router.push("/list");
        })
        .catch((err) => {
          alert("提交失败");
        });
    },
    modifyIssue() {
      let data = {
        issueId: this.ruleForm.issueId,
        issueStatus: "待解决",
        plan: this.ruleForm.plan,
        title: this.ruleForm.title,
        grade: this.ruleForm.grade,
        version: this.ruleForm.version,
        step: this.ruleForm.step,
        planTime: this.ruleForm.planTime,
      };
      //  let data={"issueId":this.$store.state.issueId,"issueStatus":"待解决"};
      //  let data={"issueId":this.$store.state.issueId,"issueStatus":"待解决","title":this.$store.state.title,"founder":this.$store.state.founder,"iCreateTime":this.$store.state.iCreateTime,"reviser":this.$store.state.reviser,"planTime":this.$store.state.planTime,"actualTime":this.$store.state.actualTime,"userId1":this.$store.state.userId1,"userId2":this.$store.state.userId2,"type":this.$store.state.type,"grade":this.$store.state.grade,"version":this.$store.state.version,"step":this.$store.state.step,"plan":this.$store.state.plan};
      axios
        .put("api/issue/updateIssue", data)
        .then((res) => {
          alert("提交成功");
          this.$router.push("/list");
        })
        .catch((err) => {
          alert("提交失败");
        });
    },
    returnlist() {
      let data = { issueId: this.ruleForm.issueId };
      // let data={"issueId":this.$store.state.issueId,"issueStatus":"已关闭"};
      //  let data={"issueId":this.$store.state.issueId,"issueStatus":"待解决","title":this.$store.state.title,"founder":this.$store.state.founder,"iCreateTime":this.$store.state.iCreateTime,"reviser":this.$store.state.reviser,"planTime":this.$store.state.planTime,"actualTime":this.$store.state.actualTime,"userId1":this.$store.state.userId1,"userId2":this.$store.state.userId2,"type":this.$store.state.type,"grade":this.$store.state.grade,"version":this.$store.state.version,"step":this.$store.state.step,"plan":this.$store.state.plan};
      axios
        .put("api/issue/closeIssue", data)
        .then((res) => {
          alert("提交成功");
          this.$router.push("/list");
        })
        .catch((err) => {
          alert("提交失败");
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