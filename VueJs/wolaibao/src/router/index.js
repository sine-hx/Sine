import Vue from 'vue'
import Router from 'vue-router'
import city from '../components/common/city'
import phoneNum from '../components/common/phoneNum'
// 记住用之前要先注册
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/city/:id', component: city,
      children:[
        {
          path: 'profile',
          name:'profile',
          component: phoneNum
        }
      ]
    }
  ]
})
