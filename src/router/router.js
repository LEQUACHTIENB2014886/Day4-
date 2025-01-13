import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
import Contact from '../views/Contact.vue';
import Login from '../views/Login.vue';
import Cart from '../views/Cart.vue';
import Products from '../views/Products.vue';

const routes = [
  { path: '/', component: Home },
  { path: '/contact', component: Contact },
  { path: '/login', component: Login },
  { path: '/cart', component: Cart },
  { path: '/products', component: Products }
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
});

export default router;
