module.exports = {
  apps: [
    {
      script: 'api.js',
      env: {
        POSTGRES_HOST: 'database-1.clujym4xkmgv.us-east-1.rds.amazonaws.com',
        POSTGRES_PORT: 5432,
        DB_TYPE: 'postgres',
        POSTGRES_USER: 'postgres',
        POSTGRES_PASSWORD: 'postgres',
        POSTGRES_DATABASE: 'nset',
        RUN_MIGRATIONS: true,
        TYPEORM_SYNC: true,
        TYPEORM_LOGGING: true,
        PORT: 3000,
      },
    },
    {
      script: 'worker.js',
    },
  ],

  // Deployment Configuration
  deploy: {
    production: {
      user: 'ubuntu',
      host: ['192.168.0.13', '192.168.0.14', '192.168.0.15'],
      ref: 'origin/develop',
      repo: 'git@github.com:Username/repository.git',
      path: '/var/www/my-repository',
      'post-deploy': 'npm install',
    },
  },
};
