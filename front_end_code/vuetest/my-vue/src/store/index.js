import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex)
const store = new Vuex.Store({
    state: {
        signed: false,

        signedUsername: '',

        signedidentity1: '',
        signedId: '',
        edit: false,
        founder: false,
        selected: false,
        submit: true,
        title: '',
        issueId: '',
        iCreateTime: '',
        planTime: '',
        actualTime: '',
        type: '',
        grade: '',
        version: '',
        step: '',
        reviser: '',
        solution: '',
        plan: '',
        jump: false,
        formdisable: false

    },

    mutations: {
        sign(state, username) {
            console.log('hhhhhhhhhh');
            console.log(username);
            console.log('hhhhhhhhhh');
            this.state.signed = true;
            this.state.signedUsername = username.username1;
            this.state.signedId = username.signid1;

            // this.state.signedidentity1 = identity;

            console.log("登录成功");
            console.log(this.state.signedUsername);

        },

        body(state, identity) {
            this.state.signed = true;
            this.state.signedidentity1 = identity;
        },
        editFun(state, res) {



            this.state.title = res.data[0].title;
            this.state.issueId = res.data[0].issueId;
            this.state.iCreateTime = res.data[0].iCreateTime;
            this.state.planTime = res.data[0].planTime;
            this.state.actualTime = res.data[0].actualTime;
            this.state.type = res.data[0].type;
            this.state.grade = res.data[0].grade;
            this.state.version = res.data[0].version;
            this.state.step = res.data[0].step;
            this.state.reviser = res.data[0].reviser;
            this.state.solution = res.data[0].solution;
            this.state.plan = res.data[0].plan;

            this.state.edit = true;
            this.state.selected = true;
            this.state.founder = false;
            this.state.submit = false;







        },
        editName11(state,name) {
            this.state.signedUsername = name;
            console.log("name");
            console.log(name);
        }
        ,
        founFun(state, res) {
            this.state.title = res.data[0].title;
            this.state.issueId = res.data[0].issueId;
            this.state.iCreateTime = res.data[0].iCreateTime;
            this.state.planTime = res.data[0].planTime;
            this.state.actualTime = res.data[0].actualTime;
            this.state.type = res.data[0].type;
            this.state.grade = res.data[0].grade;
            this.state.version = res.data[0].version;
            this.state.step = res.data[0].step;
            this.state.reviser = res.data[0].reviser;
            this.state.solution = res.data[0].solution;
            this.state.plan = res.data[0].plan;

            this.state.selected = true;
            this.state.founder = true;
            this.state.edit = false;
            this.state.submit = false;



        },
        toreturn(){
            this.state.submit = true;
            this.state.formdisable=false;

        }
        ,
        seleFun(state, res) {

            this.state.title = res.data[0].title;
            this.state.issueId = res.data[0].issueId;
            this.state.iCreateTime = res.data[0].iCreateTime;
            this.state.planTime = res.data[0].planTime;
            this.state.actualTime = res.data[0].actualTime;
            this.state.type = res.data[0].type;
            this.state.grade = res.data[0].grade;
            this.state.version = res.data[0].version;
            this.state.step = res.data[0].step;
            this.state.reviser = res.data[0].reviser;
            this.state.solution = res.data[0].solution;
            this.state.plan = res.data[0].plan;
            this.state.formdisable=true;

            this.state.selected = false;
            this.state.edit = false;
            this.state.submit = false;
            this.state.founder = false;

        },
        submitIssue() {
            this.state.selected = false;
            this.state.edit = false;
            this.state.submit = true;
            this.state.founder = false;


            this.state.title = '';
            this.state.issueId = '';
            this.state.iCreateTime = '';
            this.state.planTime = '';
            this.state.actualTime = '';
            this.state.type = '';
            this.state.grade = '';
            this.state.version = '';
            this.state.step = '';
            this.state.reviser = '';
            this.state.solution = '';
            this.state.plan = '';


        },
        changeJT() {
            this.state.jump = true

        },

        changeJF() {
            if (this.state.jump == true) {
                this.state.jump = false

            }


        }



    }
})

export default store;