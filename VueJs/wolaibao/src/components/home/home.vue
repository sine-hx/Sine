<template>
  <div id="home">
    <header-index></header-index>
    <banner></banner>
    <div class="notice">通知公告：人保电子保单系统升级通知人保电子保单系统升级通知</div>
    <div class="homeBox">
      <h3>报价下单</h3>
      <ul>
        <li class="homeBox_city">
          <span>投保城市</span>
          <div><input type="text" value="北京" readonly></div>
        </li>
        <li class="homeBox_License"><span>车牌号码</span>
          <router-link class="homeBox_LicenseAbbr" to="/city/qwe">京</router-link>
          <div class="homeBox_LicenseNum"><input type="text" value="" placeholder="请输入车牌号码"></div>
        </li>
        <li class="homeBox_name"><span>车主姓名</span>
          <div><input type="text" value="" placeholder="请输入车主姓名"></div>
        </li>
      </ul>
      <div class="homeBox_btn">
        <input type="submit" value="立即报价">
      </div>
    </div>
    <phone-num></phone-num>
  </div>
</template>
<script>
  import headerIndex from './headerIndex.vue'
  import Banner from '../common/banner.vue'
  import phoneNum from '../common/phoneNum.vue'

  export default {
    name: 'home',
    components: {
      headerIndex, Banner, phoneNum
    }
  }
</script>
<style lang="scss" rel="stylesheet/scss" scoped>
  .notice {
    height: 35px;
    color: #605543;
    font-size: 14px;
    line-height: 35px;
    padding: 0 20px 0 45px;
    background: url("../../assets/img/notice.png") no-repeat 20px #fffbde;
    background-size: 20px;
    overflow: hidden;
  }

  .homeBox {
    border-top: .3rem solid transparent;
    background-clip: padding-box, border-box;
    background-image: linear-gradient(#fff, #fff), linear-gradient(90deg, #f36d66, #f03e38);
    border-radius: .5rem;
    margin: .8rem .8rem 0;
    padding-bottom: 35px;
    -webkit-box-shadow: 0 .1rem 1rem #e7e7e7;
    -moz-box-shadow: 0 .1rem 1rem #e7e7e7;
    box-shadow: 0 .1rem .5rem #e7e7e7;

    h3 {
      color: #ee3d3d;
      font-size: 16px;
      font-weight: 600;
      line-height: 55px;
      text-align: center;
    }

    ul {
      padding: 0 20px 27px;

      li {
        height: 35px;
        font-size: 12px;
        display: box;
        padding-left: 5px;
        /*chrome*/
        display: -webkit-box;
        /*ios6*/
        display: -moz-box;
        /*垂直居中*/
        -webkit-box-align: center;
        -moz-box-align: center;

        span {
          display: block;
          padding-right: 22px;
        }
        div{
          font-size: 12px;
          -moz-box-flex: 1;
          -webkit-box-flex: 1;
          input{
            width: 100%;
          }
        }
      }
    }
  }
  .homeBox_btn {
    text-align: center;
  }

  .homeBox_city {
    background: #ffe7e9;
    border-left: 2px solid #f66972;

    div {
      input {
        background: transparent;
        font-size: 12px !important;
        background: url("../../assets/img/down.png") no-repeat right center;
        width: 95% !important;
        background-size:10px auto;
      }

    }
  }
  .homeBox_LicenseAbbr{
    background: url("../../assets/img/down.png") no-repeat right center;
    background-size:10px auto;
    padding-right: 24px;
    margin-right: 14px;
  }
  .homeBox_btn input{
    width: 110px;
    height: 38px;
    background:-webkit-linear-gradient(left,#f99195,#f03e37) ;
    color: #fff;
    border-radius:20px;
  }
</style>

