import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-rails'

export default defineConfig({
  plugins: [
    RubyPlugin(),
  ],
})
