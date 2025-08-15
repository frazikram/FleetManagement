import { registerAs } from '@nestjs/config';

export default registerAs('app', () => ({
  nodeEnv: process.env.NODE_ENV ?? 'dev',
  port: parseInt(process.env.PORT ?? '3000', 10),

  db: {
    host: process.env.DB_HOST!,
    port: parseInt(process.env.DB_PORT ?? '5432', 10),
    user: process.env.DB_USER!,
    pass: process.env.DB_PASS!,
    name: process.env.DB_NAME!,
  },

  redis: {
    host: process.env.REDIS_HOST!,
    port: parseInt(process.env.REDIS_PORT ?? '6379', 10),
  },

  jwtSecret: process.env.JWT_SECRET!,
  logLevel: process.env.LOG_LEVEL ?? 'info',
}));
