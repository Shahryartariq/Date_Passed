import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  base: '/Date_Passed/',
  plugins: [vue()],
  build: {
    outDir: 'dist'
  }
})