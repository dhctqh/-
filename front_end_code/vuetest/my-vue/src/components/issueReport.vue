<template>
  <div>
    <el-header>
      <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
        <div class="grid-content">
          <h1 style="">Issue 报表</h1>
        </div>
      </el-col>
    </el-header>

    <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
      <div class="grid-content" style="margin-left: 40px">查询条件</div>
      <el-divider></el-divider>
    </el-col>

    <div :inline="true" align="center" class="cha" style="">
      &nbsp;&nbsp; &nbsp;&nbsp;用户ID:
      <el-input
        v-model="searchId"
        placeholder="请输入用户Id"
        style="width: 240px; opacity: 0.5"
        maxlength="30"
      ></el-input>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户姓名:
      <el-input
        v-model="searchName"
        placeholder="请输入用户姓名"
        style="width: 240px; opacity: 0.5"
        maxlength="30"
      ></el-input>
    </div>
    <br />
    <div align="center" style="margin-top: 20px">
      <el-button type="primary" @click="getList" style="">查询</el-button>
      <el-button type="primary" @click="clearall" style="">清空</el-button>
    </div>

    <div style="text-align: left; margin-left: 40px; margin-top: 10px">
      统计报表
    </div>
    <el-divider></el-divider>
    <el-row :gutter="20">
      <el-col :span="20" :offset="2"
        ><div class="grid-content">
          <el-table
            height="500px"
            :data="
              tableDataEnd.slice(
                (currentPage - 1) * PageSize,
                currentPage * PageSize
              )
            "
            @cell-click="handle"
            style="opacity: 0.8; width: 80%; margin: 0 auto"
            border
            stripe
          >
            <el-table-column
              type="index"
              label="序号"
              width="180"
            ></el-table-column>
            <el-table-column label="用户ID" prop="userId1"></el-table-column>
            <el-table-column label="用户姓名" prop="founder"></el-table-column>
            <el-table-column
              label="创建Issue数"
              prop="crtCnt"
            ></el-table-column>
            <el-table-column
              label="收到Issue数"
              prop="slvCnt"
            ></el-table-column>
            <el-table-column
              label="修改Issue数"
              prop="tttCnt"
            ></el-table-column>
            <el-table-column label="完成率" prop="percent"></el-table-column>
          </el-table></div
      ></el-col>
    </el-row>

    <el-footer class="footer">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[10, 20]"
        :page-size="PageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="totalItems"
        background
        style="margin: 20px"
      >
      </el-pagination>
    </el-footer>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      searchId: "",
      searchName: "",
      tableDataEnd: [],
      currentPage: 1,
      PageSize: 20,
      totalItems: 0,
      imgSrc: require("../../static/report.jpg"),
    };
  },
  //页面初始数据
  created() {
    this.getList();
  },
  methods: {
    handleSizeChange(val) {
      this.PageSize = val;
      this.currentPage = 1;
    },
    handleCurrentChange(val) {
      this.currentPage = val;
    },
    //读取报表数据
    getList() {
      axios
        .get("api/issue/formIssue", {
          params: { userId1: this.searchId, founder: this.searchName },
        })
        .then((res) => {
          for (var i = 0; i < res.data.length; i++) {
            if (res.data[i].percent != null) {
              res.data[i].percent = res.data[i].percent + "%";
            }
          }
          this.totalItems = res.data.length;
          this.tableDataEnd = res.data;
        })
        .catch((err) => {
          this.$message({
            message: "查询失败",
            type: "error",
          });
          console.log("...err...", err);
        });
    },
    //点击创建数收到数修改数，跳转至list页面
    handle(row, column) {
      window.sessionStorage.setItem("reverse", true);
      if (
        column.label == "创建Issue数" ||
        column.label == "收到Issue数" ||
        column.label == "修改Issue数"
      ) {
        window.sessionStorage.setItem("ReportTableData", row.founder);
        this.$router.push({ name: "list" });
        this.$store.commit("changeJT");
      }
    },
    //清空按钮及重获所有数据
    clearall() {
      this.searchId = "";
      this.searchName = "";
      this.getList();
    },
  },
};
</script>

<style scoped>
.footer {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 1px;
  opacity: 0.8;
}
</style>