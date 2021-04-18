// import Account from './components/Account.vue';
// import AccountInq from './components/AccountInq.vue';
// import changePersonalImfornation from './components/changePersonalImfornation.vue';
// import HelloWorld from './components/HelloWorld.vue';

// import register from './components/register.vue';
// import sign from './components/sign.vue';
import Vue from 'vue';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import App from './App.vue';
import router from './router';
import store from './store';

import moment from 'moment'

import './assets/css/global.css'

// 导入字体图标
import './assets/fonts/iconfont.css'
Vue.use(ElementUI);
Vue.use(require('vue-moment'));
Vue.prototype.moment = moment

new Vue({
    el: '#app',
    router,
    data: {},
    store,

    render: h => h(App),

});
