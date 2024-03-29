import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';

import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
  site: 'https://nick3white.github.io/',
  base: '/blog',
  integrations: [mdx(), sitemap()],
});
