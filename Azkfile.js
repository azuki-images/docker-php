var version    = env.PHPTEST_VERSION || "latest";
// Adds the systems that shape your system
systems({
  php: {
    // More images:  http://images.azk.io
    image: { docker: "azukiapp/php:" + version },
    shell: "/bin/ash",
    workdir: "/azk/#{manifest.dir}/test",
    wait: { "retry": 25, "timeout": 1000 },
    mounts: {
        '/azk/#{manifest.dir}/test': sync("./test")
    },
    envs: {
        PHP_VERSION_NEEDED: env.PHPTEST_VERSION
    }
  },
});
