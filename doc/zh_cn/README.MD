# nvim

> 跨平台 Neovim 配置，支持 **Termux**、**Linux** 和 **Windows**。

![platform](https://img.shields.io/badge/platform-Termux%20%7C%20Linux%20%7C%20Windows-blue)
![license](https://img.shields.io/badge/license-MIT-green)
![neovim](https://img.shields.io/badge/Neovim-0.9%2B-57A143)

一套配置树，三个平台。启动时自动引导 [lazy.nvim](https://github.com/folke/lazy.nvim)，
装配 LSP / 补全 / treesitter，并附带 13 个开箱即用的配色主题。
针对各平台的微调（如诊断快捷键）已预先适配 — 参见[用法](#用法)。

## 特性

- **零手动插件管理** — `lua/opts/setup.lua` 自动安装 lazy.nvim 及全部插件
- **多语言 LSP** — C / C++ (clangd)、Rust、Go、Bash、Python、Java、Zig、PowerShell，位于 `lua/opts/lspc/`
- **补全体系** — nvim-cmp + LuaSnip + buffer/path/LSP 源
- **13 个配色主题** — 亮色与暗色，一行切换
- **按住显示诊断** — 松开按键即关闭，按平台适配
- **变更日志规范** — 每日日志存于 `log/`，可通过 `flock.sh` 锁定

## 依赖要求

| 软件包 | 用途 |
|--------|------|
| Neovim 0.9+ | 编辑器 |
| git | 插件克隆 |
| curl | 下载 |
| clang | clangd / gcc / cc |
| make | Treesitter 解析器构建 |
| nodejs | npm (pyright, bash-language-server) |
| python | Python LSP 工具 |
| tar / unzip | 压缩包解压 |
| stylua | Lua 格式化工具（见 `.stylua.toml`） |

## 安装

```bash
# Linux / Termux
git clone https://github.com/ohmycode-cn/nvim ~/.config/nvim

# Windows (PowerShell)
git clone https://github.com/ohmycode-cn/nvim $LOCALAPPDATA\nvim
```

启动 `nvim` —— lazy.nvim 会自动引导并在首次启动时安装全部插件。

## 目录结构

```
~/.config/nvim/
├── init.lua                  # 入口文件（仅含 require）
├── LICENSE                   # MIT 许可证
├── README.MD                 # 本文件
├── ACKNOWLEDGMENTS.MD        # AI 模型提供商致谢
├── .gitignore
├── .stylua.toml              # StyLua 格式化配置
├── dependences_list.ini      # 插件依赖 URL（简表）
├── dirf_struct.txt           # 目录结构参考
├── flock.sh                  # 日志文件锁定 / 解锁工具
├── lazy-lock.json            # lazy.nvim 插件版本锁定
├── doc/
│   └── dependencies.ini      # 完整依赖审计（系统 / 插件 / LSP）
├── agent/                    # AI 智能体工作流文档
│   ├── README.MD             # 智能体文档索引
│   ├── WORKFLOW.MD           # 任务执行流程
│   ├── COMMIT_RULES.MD       # 提交 / 日志 / 推送规范
│   ├── CODE_CONVENTIONS.MD   # 模块布局与代码风格
│   └── QUICK_ADD.MD          # 配方：LSP / 主题 / 快捷键 / 插件
├── log/                      # 每日变更日志（写入后锁定）
├── hty/                      # 历史快照
│   └── dirfs/                # 目录结构转储（按日期）
└── lua/
    ├── core/
    │   ├── api_interface.lua # 核心模块加载器
    │   ├── basic.lua         # 基础编辑器选项
    │   └── keyboard.lua      # 键位映射
    ├── opts/
    │   ├── api_interface.lua # 选项模块加载器
    │   ├── setup.lua         # lazy.nvim 引导与插件声明
    │   ├── cmp.lua           # nvim-cmp 自动补全配置
    │   ├── lsp.lua           # LSP 客户端配置加载器
    │   ├── treesitters.lua   # Treesitter 解析器配置
    │   └── lspc/             # 各语言 LSP 配置
    │       ├── clangd.lua    # 共享 clangd 服务器定义 (C/C++)
    │       ├── c.lua
    │       ├── cpp.lua
    │       ├── rust.lua
    │       ├── go.lua
    │       ├── bash.lua
    │       ├── py3.lua
    │       ├── java.lua
    │       ├── zig.lua
    │       └── ps1.lua
    └── pubs/
        ├── api_interface.lua # 公共模块加载器
        ├── nvim_background.lua # 主题加载器（在此切换主题）
        └── theme/            # 13 个配色主题（背景 / 前景配对）
            ├── cream.lua     # #FFF7D5 / #1A1A1A (亮色)
            ├── gray-white.lua # #F0F0F0 / #2B2B2B (亮色)
            ├── catppuccin-mocha.lua # #1E1E2E / #CDD6F4 (暗色)
            ├── dracula.lua   # #282A36 / #F8F8F2 (暗色)
            ├── gruvbox.lua   # #282828 / #EBDBB2 (暗色)
            ├── nord.lua      # #2E3440 / #D8DEE9 (暗色)
            ├── aurora.lua    # #0F111A / #E0E6F0 (暗色)
            ├── cyberpunk.lua # #0B0B1A / #E0E0FF (暗色)
            ├── ember.lua     # #181210 / #F2D8C4 (暗色)
            ├── galaxy.lua    # #100A24 / #CBB8F5 (暗色)
            ├── matrix.lua    # #000000 / #00FF41 (暗色)
            ├── synthwave.lua # #2B213A / #FFFFFF (暗色)
            └── tokyo-night.lua # #1A1B26 / #C0CAF5 (暗色)
```

## 用法

### 切换主题

编辑 `lua/pubs/nvim_background.lua` 中的 require 目标：

```lua
require("pubs.theme.dracula")   -- 从 lua/pubs/theme/ 中任选一个主题
```

### 按住显示诊断

| 按键 | 平台 | 说明 |
|------|------|------|
| `Ctrl+Alt+Shift+K` | 桌面 (Linux / Windows) | 桌面默认映射 |
| `Alt+K` | Termux | 规避 Android Alt+Shift 键盘冲突 |
| `Ctrl+Alt+K` | 通用 | 备用映射 |

按住按键在浮动窗口中显示诊断信息，松开即关闭。

### 锁定日志文件 (`flock.sh`)

`log/` 每天存储一份合并的变更日志。写入日志条目后，
锁定文件以防误编辑：

```bash
bash flock.sh lock     # chmod u-w log/*.txt  （无参数时为默认操作）
bash flock.sh unlock   # chmod u+w log/*.txt  （写入新条目前解锁）
```

> 请在仓库根目录下运行。基于 `chmod`，适用于 Termux / Linux / macOS；
> 在 Windows 上该脚本对权限无效。

## 插件

| 插件 | 用途 |
|------|------|
| lazy.nvim | 插件管理器 |
| tokyonight.nvim | 配色方案 |
| nvim-lspconfig | LSP 客户端配置 |
| nvim-cmp | 自动补全 |
| cmp-nvim-lsp | LSP 补全源 |
| cmp-buffer | 缓冲区补全源 |
| cmp-path | 路径补全源 |
| LuaSnip | 代码片段引擎 |
| cmp_luasnip | 代码片段补全源 |
| nvim-treesitter | 语法高亮 |

## 许可证

[MIT](LICENSE)

## 致谢

支持本项目的 AI 模型提供商 — 参见 [ACKNOWLEDGMENTS.MD](../ACKNOWLEDGMENTS.MD)。
