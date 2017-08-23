<template>
  <div id="headerIndex" class="headerIndex">
    <div class="headerIndex_message"><i>99</i></div>
    <div class="headerIndex_name"><img src="../../assets/img/logoWord.png"></div>
    <div class="headerIndex_phone">&nbsp;</div>
  </div>
</template>
<script>
  export default {
    name: 'headerIndex'
  }
</script>
<style lang="scss" rel="stylesheet/scss" scoped>
  .headerIndex {
    padding: 0 13px;
    height:53px;
    display: box; /* OLD - Android 4.4- */
    display: -webkit-box; /* OLD - iOS 6-, Safari 3.1-6 */
    display: -moz-box; /* OLD - Firefox 19- (buggy but mostly works) */
    display: -o-box; /*横向两端对齐*/
    -moz-box-pack: justify;
    -webkit-box-pack: justify; /*垂直居中*/
    -moz-box-align: center;
    -webkit-box-align: center;
    background: #fff;
  }

  .headerIndex_message {
    width: 18px;
    height: 18px;
    background: url("../../assets/img/grayMessage.png") no-repeat;
    background-size: 18px;
    position: relative;
    i{
      position: absolute;
      background:#f01d14;
      color: #fff;
      border-radius:10px;
      left: 10px;
      top:-10px;
      font-size: 10px;
      padding: 0 5px;
    }
  }

  .headerIndex_name  {
    img{
      width: 52px
    }
  }

  .headerIndex_phone {
    width: 14px;
    background: url("../../assets/img/grayPhone.png") no-repeat;
    background-size: 16px
  }
</style>

