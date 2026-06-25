import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue()],
  build: {
    rollupOptions: {
      output: {
        entryFileNames: 'assets/portfolio-[hash].js',
        chunkFileNames: 'assets/portfolio-[hash].js',
        assetFileNames: 'assets/portfolio-[hash][extname]',
      },
    },
  },
})
