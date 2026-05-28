local jdtls = require("jdtls")
local jdtls_setup = require("jdtls.setup")

local root_dir = jdtls_setup.find_root({ "mvnw", "gradlew", "pom.xml", "build.gradle", "build.gradle.kts", ".git" })
if not root_dir then
  return
end

local function package_path(package_name)
  local ok, registry = pcall(require, "mason-registry")
  if not ok then
    return nil
  end

  local package_ok, package = pcall(registry.get_package, package_name)
  if not package_ok then
    return nil
  end

  return package:get_install_path()
end

local function glob(pattern)
  return vim.split(vim.fn.glob(pattern), "\n", { trimempty = true })
end

local jdtls_path = package_path("jdtls")
local jdtls_bin = jdtls_path and (jdtls_path .. "/bin/jdtls") or vim.fn.exepath("jdtls")
local lombok_jar = jdtls_path and (jdtls_path .. "/lombok.jar") or nil
local project_name = vim.fn.fnamemodify(root_dir:gsub("/$", ""), ":t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

local bundles = {}
local java_debug_path = package_path("java-debug-adapter")
if java_debug_path then
  vim.list_extend(bundles, glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"))
end

local java_test_path = package_path("java-test")
if java_test_path then
  vim.list_extend(bundles, glob(java_test_path .. "/extension/server/*.jar"))
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

local cmd = { jdtls_bin, "-data", workspace_dir }
if lombok_jar and vim.fn.filereadable(lombok_jar) == 1 then
  table.insert(cmd, "--jvm-arg=-javaagent:" .. lombok_jar)
end

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { buffer = true, desc = desc })
end

local config = {
  cmd = cmd,
  root_dir = root_dir,
  capabilities = capabilities,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {},
      },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "org.mockito.Mockito.*",
          "org.mockito.ArgumentMatchers.*",
        },
        importOrder = { "java", "jakarta", "javax", "com", "org" },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
      references = { includeDecompiledSources = true },
      inlayHints = {
        parameterNames = { enabled = "all" },
      },
    },
    spring = {
      boot = {
        validation = { enabled = true },
      },
    },
  },
  init_options = {
    bundles = bundles,
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
  },
  on_attach = function()
    pcall(jdtls.setup_dap, { hotcodereplace = "auto" })
    pcall(require("jdtls.dap").setup_dap_main_class_configs)

    map("n", "<leader>jo", jdtls.organize_imports, "Java Organize Imports")
    map("n", "<leader>jv", jdtls.extract_variable, "Java Extract Variable")
    map("x", "<leader>jv", function()
      jdtls.extract_variable(true)
    end, "Java Extract Variable")
    map("x", "<leader>jm", function()
      jdtls.extract_method(true)
    end, "Java Extract Method")
    map("n", "<leader>jt", jdtls.test_nearest_method, "Java Test Nearest Method")
    map("n", "<leader>jT", jdtls.test_class, "Java Test Class")
    map("n", "<leader>ju", jdtls.update_project_config, "Java Update Project Config")
    map("n", "<leader>jr", "<cmd>JdtRestart<cr>", "Java Restart JDTLS")
  end,
}

jdtls.start_or_attach(config)
