# 1 这个hexo模板如何使用https://github.com/tangyuxian/hexo-theme-tangyuxian

你问的这个 Hexo 主题 —— [hexo-theme-tangyuxian](https://github.com/tangyuxian/hexo-theme-tangyuxian) —— 是一个开源的 Hexo 主题，下面我帮你整理一份详细的使用指南，教你如何安装、配置和使用这个主题。

---

# Hexo 主题：hexo-theme-tangyuxian 使用教程

---

## 一、前提准备

1. **你已经安装好了 Hexo 环境**
   需要有 Node.js、npm 和 Hexo 本地环境。
   例如：

   ```bash
   node -v
   npm -v
   hexo -v
   ```

2. **你已经创建好了 Hexo 博客**
   如果没有，可以先执行：

   ```bash
   hexo init your-blog
   cd your-blog
   npm install
   ```

---

## 二、安装主题

### 方法1：Git 子模块方式（推荐）

```bash
cd your-blog
git submodule add https://github.com/tangyuxian/hexo-theme-tangyuxian.git themes/tangyuxian
```

这样主题会被下载到 `themes/tangyuxian` 文件夹。

---

### 方法2：直接下载 ZIP 解压

1. 访问 [https://github.com/tangyuxian/hexo-theme-tangyuxian](https://github.com/tangyuxian/hexo-theme-tangyuxian)
2. 点击 **Code** -> **Download ZIP**
3. 解压后将内容放入你的博客目录下的 `themes/tangyuxian` 文件夹

---

## 三、配置 Hexo 使用该主题

编辑博客根目录下的 `_config.yml` 文件，将主题改为 `tangyuxian`：

```yaml
theme: tangyuxian
```

---

## 四、安装依赖（如有）

这个主题可能需要你安装一些 Hexo 插件，推荐安装以下插件：

```bash
npm install hexo-generator-index hexo-generator-archive hexo-generator-category hexo-generator-tag hexo-renderer-markdown-it --save
```

---

## 五、主题配置

在 `themes/tangyuxian/_config.yml` 里，有主题的详细配置项，你可以根据需求修改，比如：

* 站点标题、描述
* 侧边栏配置
* 文章显示样式
* 代码高亮
* 社交链接
* 友情链接

---

## 六、运行预览

回到博客根目录，执行：

```bash
hexo clean
hexo g
hexo s
```

然后打开浏览器访问：`http://localhost:4000` 查看效果。

---

## 七、部署

你可以根据 Hexo 官方部署指南，部署到 GitHub Pages、Gitee 或自己的服务器。

例如部署到 GitHub Pages：

1. 配置 `_config.yml` 部署部分：

```yaml
deploy:
  type: git
  repo: https://github.com/你的用户名/你的仓库.git
  branch: gh-pages
```

2. 安装部署插件：

```bash
npm install hexo-deployer-git --save
```

3. 执行部署：

```bash
hexo clean && hexo g && hexo d
```

---

## 八、更多资源

* 主题仓库地址：[https://github.com/tangyuxian/hexo-theme-tangyuxian](https://github.com/tangyuxian/hexo-theme-tangyuxian)
* 主题文档通常写在仓库的 README.md 或 `docs/` 文件夹里
* 可以参考作者提供的示例博客（如有）

---

如果你需要，我也可以帮你写一份完整的 Hexo 博客从安装、主题安装到部署的脚本和步骤说明。或者帮你配置主题参数，做个个性化定制，告诉我！

# 2 详细解释一下部署流程

当然可以！我们来一步步**详细解释 Hexo 博客部署流程**，以部署到 **GitHub Pages** 为例，适合大多数人使用。整个流程分为三大部分：

---

# ✅ 部署前准备（只需一次）

### ✅ 1. 你需要准备：

| 项目               | 说明                                                      |
| ---------------- | ------------------------------------------------------- |
| 一个 GitHub 账号     | 没账号就去 [https://github.com](https://github.com) 注册       |
| 安装 Git           | 到 [git-scm.com](https://git-scm.com/) 安装 Git，并配置好用户名和邮箱 |
| 本地已经配置好的 Hexo 博客 | 比如你用 `hexo init` 初始化并能 `hexo s` 启动预览了                   |

---

# 🛠️ 第一步：安装部署插件（只需一次）

Hexo 使用 `hexo-deployer-git` 插件将博客部署到 GitHub。

在你的博客根目录下执行：

```bash
npm install hexo-deployer-git --save
```

---

# 🧰 第二步：配置 `_config.yml` 文件中的 deploy 部分

打开博客根目录下的 `_config.yml` 文件（不是 themes 下的！），找到底部的 `deploy` 部分，修改如下：

```yaml
deploy:
  type: git
  repo: https://github.com/你的用户名/你的仓库名.git
  branch: gh-pages
```

例如你的 GitHub 用户名是 `aku05`，你创建了一个名为 `akubi-blog` 的仓库，则填：

```yaml
deploy:
  type: git
  repo: https://github.com/aku05/akubi-blog.git
  branch: gh-pages
```

---

# 🧱 第三步：配置 GitHub 仓库（只需一次）

### 方法 A（推荐）：**创建一个独立的仓库用于部署**

1. 进入 GitHub → 点击右上角 `+` → `New repository`
2. 名称填 `akubi-blog`（你喜欢什么都行）
3. 不要勾选 README（保持空仓库）
4. 创建完成后复制仓库地址备用

---

### 方法 B：用 GitHub Pages 的用户名仓库（自动绑定 `https://用户名.github.io`）

如果你希望通过：`https://aku05.github.io` 访问网站，那么就：

1. 仓库名字必须叫：`aku05.github.io`
2. 分支可以使用 `main` 或 `master`，Hexo 部署到这个分支就行

---

# 🚀 第四步：部署 Hexo 到 GitHub Pages

每次你写完文章、准备发布的时候，执行：

```bash
hexo clean     # 清除旧的生成文件（建议每次部署前执行）
hexo g         # 生成静态文件（等价于 hexo generate）
hexo d         # 部署到 GitHub（等价于 hexo deploy）
```

或者一步到位：

```bash
hexo clean && hexo g && hexo d
```

---

## ✨ 成功部署后

* 打开浏览器访问：

  * 如果你是用 `gh-pages` 分支部署到普通仓库 → `https://用户名.github.io/仓库名`
  * 如果你是用 `main` 分支部署到 `username.github.io` 仓库 → `https://用户名.github.io`

---

## 🔒 如果部署时报错（常见问题）：

### ❌ 报错：`Permission denied (publickey)`

说明你没有配置 Git SSH 密钥。

**解决方案 1（推荐）**：使用 HTTPS 地址部署
确认 `_config.yml` 的 repo 填的是：

```yaml
repo: https://github.com/用户名/仓库名.git
```

而不是：

```yaml
repo: git@github.com:用户名/仓库名.git
```

---

### ❌ 报错：`fatal: destination path already exists and is not an empty directory`

说明你博客目录里已有 `.deploy_git/` 文件夹，且冲突了。

**解决方案**：

```bash
rm -rf .deploy_git
hexo d
```

---

## 🧠 可选：自动部署 + 绑定自定义域名 + Gitee 同步部署

这些是更高级的功能，如果你有兴趣，我可以继续为你定制自动化部署、部署到 Gitee、加域名等。

---

## ✅ 总结部署命令（每次更新博客都执行）

```bash
hexo clean
hexo g
hexo d
```

---

是否需要我帮你写一套完整配置模板和命令？或者你把你的 GitHub 地址发我，我可以一步步帮你对照检查。

# 3 解释一下hexo项目的基本框架

Hexo 是一个快速、简洁且高效的静态博客框架，使用 Node.js 编写，适合用来搭建技术博客或个人网站。一个典型的 Hexo 项目的基本框架（目录结构）如下：

```
my-hexo-blog/
├── _config.yml            # Hexo 的全局配置文件
├── package.json           # Node.js 项目描述文件，记录依赖项
├── scaffolds/             # 模板文件夹，用于生成新文章时的默认内容
├── source/                # 网站的源文件目录（如文章、图片）
│   ├── _posts/            # 存放 Markdown 格式博客文章
│   └── ...                # 其他静态资源，比如 about.md、图片等
├── themes/                # 主题文件夹，可以有多个主题，但启用一个
│   └── <theme-name>/      # 当前使用的主题文件夹
├── public/                # Hexo 生成的静态文件（`hexo generate` 后出现）
└── node_modules/          # Node.js 依赖库（安装后出现）
```

### 各部分详细解释：

---

#### 1. `_config.yml`

* Hexo 的主配置文件，用于设置站点的基本信息和行为。
* 常见设置项有：

  ```yaml
  title: My Blog
  subtitle: Hello World
  description: This is my blog
  author: Luke
  language: zh-CN
  theme: next
  ```

---

#### 2. `package.json`

* 管理 Hexo 所需的依赖，比如插件、主题等。
* 安装插件或部署工具时会自动记录到此文件中。

---

#### 3. `scaffolds/`

* 模板目录，定义新建文章、页面的默认结构。
* 包含以下模板文件（可自定义）：

  * `post.md`：新文章
  * `page.md`：新页面
  * `draft.md`：草稿

---

#### 4. `source/`

* 网站的内容源文件目录。
* `_posts/`：文章存放位置，Markdown 格式，命名如 `2025-06-21-hello-world.md`
* 其他内容：

  * `about/index.md`：关于页面
  * `images/`：图片资源
  * 你也可以创建自定义页面、子文件夹等。

---

#### 5. `themes/`

* 存放 Hexo 主题。
* 默认主题为 `landscape`，但常用如 `next`, `butterfly`, `matery` 等主题需手动安装。
* 启用主题的方法是在 `_config.yml` 中修改：

  ```yaml
  theme: next
  ```

---

#### 6. `public/`

* Hexo 执行 `hexo generate` 或 `hexo g` 后生成的静态 HTML 文件。
* 不应手动修改，Hexo 每次生成会清空并重建该目录。

---

#### 7. `node_modules/`

* 存放通过 `npm install` 安装的依赖模块（如 Hexo 本体和插件）。
* 不建议手动修改。

---

### Hexo 常用命令简述：

| 命令                         | 功能说明          |
| -------------------------- | ------------- |
| `hexo init`                | 初始化一个 Hexo 项目 |
| `hexo new post "title"`    | 创建一篇新文章       |
| `hexo new page "about"`    | 创建一个新页面       |
| `hexo g` 或 `hexo generate` | 生成静态网页        |
| `hexo s` 或 `hexo server`   | 本地启动服务器浏览博客   |
| `hexo d` 或 `hexo deploy`   | 部署到远程（需配置）    |

---

如你有部署 GitHub Pages、配置自定义域名、添加评论系统（如 Valine、Waline）、开启搜索功能等需求，也可以继续拓展这个框架。

如需我帮你分析具体某个 Hexo 项目结构或某主题文件夹，我也可以详细解释。是否要我展示某个例子？
