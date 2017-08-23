<template>
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide" v-for="str in listImg"
           :style="{ backgroundImage: 'url(' + str.thumb_image + ')' }"></div>
    </div>
    <div class="swiper-pagination"></div>
  </div>
</template>

<script>
  //  import Vue from 'vue'
  //  import VueResource from 'vue-resource'
  //  Vue.use(VueResource)
  //  import {API_ADDR, headers} from '../../assets/js/server.js'
  //  import {genJsonRequest} from '../../assets/js/wlbrequest.js'
  import Swiper from 'swiper'

  export default {
//    props: ['listImg'],
    data () {
      return {
        listImg: [{thumb_image: 'https://test.wolaibao.com/wlb_official/static/img/banner/85afe1e5669fab10868f591778aea7ce.jpg'}, {thumb_image: 'https://test.wolaibao.com/wlb_official/static/img/banner/85afe1e5669fab10868f591778aea7ce.jpg'}]
      }
    },
    created: function () {
//      this.$http({
//        method: 'POST',
//        url: API_ADDR + '/activity/indexBanner.json',
//        headers: headers,
//        params: genJsonRequest({type: 0, appVersion: 20000})
//      }).then(function (data) {
//        console.log(data)
//        this.listImg = data.body.list
//      })
    },
    mounted: function () {
      var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        paginationType: 'bullets',
        paginationHide: true,
        paginationElement: 'li',
        loop: true,
        speed: 600,
        autoplay: 4000,
        observer: true,
        observeParents: true,
        slidesPerView: 1,
        onTouchEnd: function () {
          swiper.startAutoplay()
        }
      })
    }
  }
</script>

<style lang="scss" rel="stylesheet/scss" scoped>
  @import "../../assets/css/swiper.css";

  .swiper-container {
    width: 100%;
    height: 10rem;

  .swiper-wrapper {
    width: 100%;
    height: 100%;
  }

  .swiper-slide {
    background-position: center;
    background-size: cover;
    width: 100%;
    height: 100%;

  img {
    width: 100%;
    height: 100%;
  }

  }
  }

</style>
