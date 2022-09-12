// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Localising Paratext Videos',
  tagline: 'Some hints on how to localise the videos',
  url: 'https://JenniBeadle.github.io/',
  baseUrl: '/ptx-vid-loc/',
  onBrokenLinks: 'throw',
  trailingSlash: false,
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'JenniBeadle', // Usually your GitHub org/user name.
  projectName: 'ptx-vid-loc', // Usually your repo name.

  // Even if you don't use internalization, you can use this field to set useful
  // metadata like html lang. For example, if your site is Chinese, you may want
  // to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en', 'fr', 'es'],
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          routeBasePath: '/',
          // Remove this to remove the "edit this page" links.
          editUrl:
            'https://github.com/JenniBeadle/ptx-vid-loc/tree/main',
        },
        blog: false,
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],
  themes: [
    [    '@easyops-cn/docusaurus-search-local',
        {
        // ... Your options.
        // `hashed` is recommended as long-term-cache of index file is possible.
        hashed: true,
        language: ["en", "fr"],
        indexBlog: false,
        indexPages: false,
        docsRouteBasePath: "/",
      },
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: 'Localising Paratext Videos',
/*         logo: {
          alt: 'Paratext Logo',
          src: 'img/logo9.png',
        },
 */        items: [
/*           {
            type: 'doc',
            docId: 'intro',
            position: 'left',
            label: 'Docs',
          },
 */          //{to: '/blog', label: 'Blog', position: 'left'},
          {
            href: 'https://github.com/JenniBeadle/ptx-vid-loc/',
            label: 'GitHub',
            position: 'right',
          },
          {
            type: "localeDropdown",
            position: 'right',
        },
        {
          type: "docsVersionDropdown",
          position: 'right',
        }, 
       ],
      },
      footer: {
        style: 'dark',
        links: [
          {
/*             title: 'Docs',
            items: [
              {
                label: 'Docs',
                to: 'docs/intro',
              },
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'Stack Overflow',
                href: 'https://stackoverflow.com/questions/tagged/docusaurus',
              },
              {
                label: 'Discord',
                href: 'https://discordapp.com/invite/docusaurus',
              },
              {
                label: 'Twitter',
                href: 'https://twitter.com/docusaurus',
              },
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'Blog',
                to: '/blog',
              },
              {
                label: 'GitHub',
                href: 'https://github.com/JenniBeadle/ptx-vid-loc',
              },
            ],
*/          },
        ],
      copyright: `Copyright © ${new Date().getFullYear()} SIL International. Built with Docusaurus.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
      },
    }),
};
async function createConfig() {
  const mdxMermaid = await import('mdx-mermaid')

  return {
    presets: [
      [
        'classic',
        {
          docs: {
            remarkPlugins: [mdxMermaid.default],
          }
        }
      ]
    ]
  }
}
module.exports = config;
