import Vue from 'vue'
import Router from 'vue-router'
import register from '@/components/register'
import controllerPage from '@/components/controllerPage'
import changeAccount from '@/components/changeAccount'
import sign from '@/components/sign'
import fristPage from '@/components/fristPage'
import accountList from '@/components/accountList' //账户管理页面
import issueReport from '@/components/issueReport'
import issueSearch from '@/components/issueSearch'
import buildOrEditIssue from '@/components/buildOrEditIssue'
import welcome from '@/components/welcome'
import detailIssue from '@/components/detailIssue'
Vue.use(Router)

export default new Router({
    routes: [
       
        // {
        //     path: '/',
        //     name: 'fristPage',
        //     component: fristPage
        // },
        {
            path: '/Helloworld',
            name: 'Helloworld',
            component: controllerPage,
            redirect:'/welcome',
       
            children: [
                {
                    path: '/welcome',
                    name: 'welcome',
                    component: welcome
                },
            
            {
                path: '/Account',
                name: 'Account',
                component: accountList
            },
            {
                path: '/detailIssue',
                name: 'detailIssue',
                component: detailIssue
            },
            {
                path: '/Issue_report_form',
                name: 'Issue_report_form',
                component: issueReport
            },
            {
                path: '/HelloWorld_xinIssue',
                name: 'HelloWorld_xinIssue',
                component: buildOrEditIssue
            },
            {
                path: '/list',
                name: 'list',
                component: issueSearch
            },


              ]
        },


        {
            path: '/',
            name: 'sign',
            component: sign
        },
        {
            path: '/register',
            name: 'register',
            component: register
        },
        {
            path: '/changePersonalImfornation',
            name: 'changePersonalImfornation',
            component: changeAccount
        }

        
        
        

    ]
});




// Vue.use(VueRouter);

// const routes = [
//     { path: '/', component:HelloWorld }

// ];

// const router = new Router({
//     routes
// });

// export default router;