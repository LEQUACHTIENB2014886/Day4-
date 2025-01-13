<template>
  <div>
    <div v-for="product in products" :key="product.id">
      <div @click="viewProduct(product.id)">
        <img :src="product.image" alt="Product image" />
        <p>{{ product.name }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      products: [
        { id: 1, name: 'Product 1', image: '@assets/products/1.jpg' },
        { id: 2, name: 'Product 2', image: 'path-to-image' },
        // Add other products here
      ],
    };
  },
  methods: {
    viewProduct(id) {
      this.$router.push({ name: 'ProductDetail', params: { id } });
    },
  },
};
</script>
