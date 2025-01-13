<template>
  <div>
    <div class="carousel-container">
      <el-carousel :interval="3000" arrow="always" height="600px">
        <el-carousel-item v-for="(item, index) in images" :key="index">
          <div class="carousel-item">
            <img :src="item.src" :alt="item.alt" class="carousel-image" />
          </div>
        </el-carousel-item>
      </el-carousel>
    </div>
    <hr />

    <div class="flash-sale">
      <el-row>
        <el-col>
          <div class="sale-title">Các sản phẩm hiện đang SALE</div>
          <div class="countdown-wrapper">
            <div class="countdown">
              <div class="time-box" v-text="hours"></div>
              <div class="time-box" v-text="minutes"></div>
              <div class="time-box" v-text="seconds"></div>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
    <hr />

    <div class="product">
      <el-row :gutter="20">
        <el-col :span="6" v-for="(product, index) in products" :key="index">
          <div class="grid-content">
            <img
              :src="product.image"
              :alt="product.name"
              class="product-image"
            />
            <div class="product-details">
              <div class="product-name">{{ product.name }}</div>
              <div class="product-brand">{{ product.brand || 'Brand not available' }}</div>

              <div class="product-prices">
                <div class="original-price">
                  {{ product.originalPrice }} VND
                </div>
              </div>
              <div class="product-prices">
                <div class="sale-price">{{ product.salePrice }} VND</div>
              </div>
              <div class="rate">
                <el-rate
                  v-model="product.rate"
                  disabled
                  show-score
                  text-color="#ff9900"
                  score-template="{value} sao"
                />
              </div>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import { ElCarousel, ElCarouselItem } from "element-plus";
import { ref, onMounted } from "vue";
import axios from "axios"; // Import axios

export default {
  components: {
    ElCarousel,
    ElCarouselItem,
  },
  setup() {
    const images = ref([]);
    const products = ref([]);
    const hours = ref("00");
    const minutes = ref("00");
    const seconds = ref("00");

    // Lấy dữ liệu carousel
    const fetchCaroselImages = async () => {
      try {
        const response = await axios.get("http://localhost:8080/api/carosel");
        images.value = response.data;
      } catch (error) {
        console.error("Error fetching carousel images:", error);
      }
    };

    // Lấy dữ liệu sản phẩm
    const fetchProducts = async () => {
      try {
        const response = await axios.get("http://localhost:8080/api/products");
        products.value = response.data;
        console.log(response.data);
      } catch (error) {
        console.error("Error fetching products:", error);
      }
    };

    // Tính toán thời gian đếm ngược
    const calculateTimeLeft = () => {
      const targetDate = new Date("2025-02-22T00:00:00");
      const currentDate = new Date();
      const difference = targetDate - currentDate;

      if (difference > 0) {
        const hrs = Math.floor(
          (difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
        );
        const mins = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
        const secs = Math.floor((difference % (1000 * 60)) / 1000);

        hours.value = String(hrs).padStart(2, "0");
        minutes.value = String(mins).padStart(2, "0");
        seconds.value = String(secs).padStart(2, "0");
      } else {
        hours.value = minutes.value = seconds.value = "00";
      }
    };

    // Gọi API và bắt đầu tính toán khi component được mount
    onMounted(() => {
      fetchCaroselImages();
      fetchProducts();
      calculateTimeLeft();
      setInterval(calculateTimeLeft, 1000);
    });

    return { images, products, hours, minutes, seconds };
  },
};
</script>

  <style scoped>


.carousel-container {
  width: 90%;
  max-width: 100%;
  margin: 0 auto;
  margin-top: 10px;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.carousel-item {
  position: relative;
  text-align: center;
  color: gray;
  font-size: 22px;
}

.carousel-image {
  width: 100%;
  height: 90%;
  object-fit: cover;
}

.sale-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
  text-align: center;
  color: #333;
}

.countdown-wrapper {
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.countdown {
  display: flex;
  justify-content: space-between;
}

.time-box {
  font-size: 15px;
  font-weight: bold;
  background-color: red;
  color: white;
  padding: 5px 10px;
  border-radius: 5px;
  margin: 0 5px;
  margin-bottom: 5px;
  width: 20px;
  text-align: center;
}

.product-image {
  width: 100%;
  height: auto;
  object-fit: cover;
  border-radius: 8px;
}

.product {
  margin-bottom: 20px;
}

.product-details {
  margin-left: 10px;
  margin-top: 10px;
  text-align: center;
}

.product-name {
  font-size: 18px;
  font-weight: bold;
  color: black;
}

.product-prices {
  display: flex;
  justify-content: space-between;
  margin-top: 5px;
  font-size: 16px;
}
.product-brand{
  display: flex;
  justify-content: space-between;
  font-size: 15px;
  color:#333;
  font-weight:bolder;
  margin-top: 10px;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.rate {
  display: flex;
  justify-content: space-between;
}

.original-price {
  text-decoration: line-through;
  color: darkgray;
}

.sale-price {
  font-weight: bold;
  color: red;
}

.grid-content {
  border: 2px solid #ddd;
  border-radius: 8px;
  padding: 10px;
  margin-bottom: 10px;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.grid-content:hover {
  transform: translateY(-5px);
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
}

.el-row {
  max-width: 100%;
}
</style>