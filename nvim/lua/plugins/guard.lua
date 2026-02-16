return {
    "nvimdev/guard.nvim",
    dependencies = { "nvimdev/guard-collection" },
    init = function()
        vim.g.guard_config = {
            fmt_on_save = false,
            save_on_fmt = true,
            lsp_as_default_formatter = true,
        }
    end,
    config = function()
        local ft = require("guard.filetype")
        ft("python"):fmt("ruff"):lint("ruff"):lint("mypy")
        ft("lua"):fmt("stylua"):lint("selene")
        ft("javascript,javascriptreact,typescript,typescriptreact"):fmt("prettierd"):lint("eslint")
        ft("go"):fmt("gofumpt"):append({
            cmd = "golines",
            args = { "--max-len=120" },
            stdin = true,
        }):lint({
            cmd = "golangci-lint",
            args = { "run", "--out-format", "json" },
            stdin = false,
        })
        ft("rust"):fmt("rustfmt"):lint({
            cmd = "cargo",
            args = { "clippy", "--message-format=json" },
            stdin = false,
        })
        ft("c,cpp"):fmt("clang-format"):lint("cpplint")
        ft("css,graphql,html,json,jsonc,yaml"):fmt("prettierd")
        ft("sh,bash,zsh"):fmt({
            cmd = "shfmt",
            args = { "-i", "2" },
            stdin = true,
        }):lint("shellcheck")
        ft("nix"):fmt("nixfmt"):lint({
            cmd = "statix",
            args = { "check", "--stdin" },
            stdin = true,
        })
        ft("toml"):fmt("taplo")
        ft("sql"):fmt("sqlfluff"):lint("sqlfluff")
        ft("dockerfile"):lint("hadolint")
        ft("cmake"):fmt("cmake-format"):lint("checkmake")
        ft("make"):lint("checkmake")
        ft("markdown"):fmt("prettierd")
        ft("proto"):fmt("buf"):lint("buf")
    end,
}
