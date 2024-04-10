module.exports = {
  apps: [
    {
      name: "DATA_PLATFORM Rest API",
      cwd: "/data/backend",
      script: "yarn",
      args: "run prod",
      watch: true,
      autorestart: true,
      exec_mode: "cluster",
      instances: "1",
      ignore_watch: ["node_modules", "logs", "download-file"],
    },
  ],
};
