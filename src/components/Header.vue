<template>
  <el-container>
    <el-header class="header">
      <div class="header-content">
        <router-link to="/" class="nav-item">
          <div>
            <el-icon>
              <HomeFilled />
            </el-icon>
            <span>Trang chủ</span>
          </div>
        </router-link>

        <router-link to="/products" class="nav-item">
          <div>
            <el-icon>
              <Fold />
            </el-icon>
            <span>Sản phẩm</span>
          </div>
        </router-link>

        <router-link to="/login" class="nav-item">
          <div>
            <el-icon>
              <User />
            </el-icon>
            <span>Đăng nhập</span>
          </div>
        </router-link>

        <router-link to="/cart" class="nav-item">
          <div>
            <el-icon>
              <ShoppingCart />
            </el-icon>
            <span>Giỏ hàng</span>
          </div>
        </router-link>

        <router-link to="/contact" class="nav-item">
          <div>
            <el-icon>
              <PhoneFilled />
            </el-icon>
            <span>Liên hệ</span>
          </div>
        </router-link>

        <div class="search-item">
          <el-input v-model="searchQuery" placeholder="Nhập từ khóa tìm kiếm" class="input-search">
            <template #prefix>
              <el-icon style="color: black;">
                <Search />
              </el-icon>
            </template>
          </el-input>
        </div>
      </div>
    </el-header>
  </el-container>
</template>

<script setup>
import { ref } from "vue";
import { ElContainer, ElHeader, ElInput, ElIcon } from "element-plus";
import {
  HomeFilled,
  ShoppingCart,
  User,
  PhoneFilled,
  Fold,
  Search
} from "@element-plus/icons-vue";

const searchQuery = ref("");
</script>

<style scoped>
.header {
  width: 100%;
  background: #333;
  color: white;
  padding: 15px;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.header-content {
  display: flex;
  justify-content: space-around;
  align-items: center;
  width: 100%;
  max-width: 1100px;
}

.nav-item {
  display: flex;
  align-items: center;
  padding: 7px 15px;
  cursor: pointer;
  transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out,
    background-color 0.3s ease-in-out;
  text-decoration: none;
  color: white;
  border-radius: 8px;
}

.nav-item div {
  display: flex;
  align-items: center;
}

.nav-item:hover {
  transform: scale(1.1);
  opacity: 0.8;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3);
  background-color: #444;
}

.nav-item span {
  font-size: 16px;
  font-weight: bold;
  text-transform: uppercase;
  color: white;
  margin-left: 8px;
  transition: color 0.3s ease-in-out;
}

.nav-item:hover span {
  color: #ddd;
}

.search-item {
  margin-left: 20px;
  display: flex;
  align-items: center;
}

.input-search .el-input__inner {
  background-color: #555;
  color: white;
  transition: all 0.3s ease;
}

.input-search .el-input__inner:hover {
  border-color: white;
  transform: scale(1.05);
}

.input-search .el-input__inner::placeholder {
  color: white;
}

.input-search .el-input__inner:hover::placeholder {
  color: #aaa;
}
</style>
