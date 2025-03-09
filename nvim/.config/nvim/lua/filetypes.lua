vim.filetype.add({
  pattern = {
    -- INFO: Match filenames like - ".env.example", ".env.local" and so on
    ["%.env%.[%w_.-]+"] = "sh",
    ["docker-compose%.yml"] = "yaml.docker-compose",
    ["docker-compose%.yaml"] = "yaml.docker-compose",
    ["compose%.yml"] = "yaml.docker-compose",
    ["compose%.yaml"] = "yaml.docker-compose",
  },
  filename = {
    ["docker-compose-build.yml"] = "yaml.docker-compose",
    ["docker-compose-build.yaml"] = "yaml.docker-compose",
    ["docker-compose-prod.yml"] = "yaml.docker-compose",
    ["docker-compose-prod.yaml"] = "yaml.docker-compose",
    ["docker-compose-test.yml"] = "yaml.docker-compose",
    ["docker-compose-test.yaml"] = "yaml.docker-compose",
    ["docker-compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["compose.yaml"] = "yaml.docker-compose",
  },
})
