import { plainToInstance } from 'class-transformer';
import { IsNumber, IsString, validateSync } from 'class-validator';

class EnvSchema {
  @IsString() NODE_ENV!: string;
  @IsNumber() PORT!: number;

  @IsString() DB_HOST!: string;
  @IsNumber() DB_PORT!: number;
  @IsString() DB_USER!: string;
  @IsString() DB_PASS!: string;
  @IsString() DB_NAME!: string;

  @IsString() REDIS_HOST!: string;
  @IsNumber() REDIS_PORT!: number;

  @IsString() JWT_SECRET!: string;
  @IsString() LOG_LEVEL!: string;
}

export function validatEnv(config: Record<string, unknown>) {
  const toValidate = {
    ...config,
    PORT: Number(config.PORT ?? 3000),
    DB_PORT: Number(config.DB_PORT ?? 5432),
    REDIS_PORT: Number(config.REDIS_PORT ?? 6379),
  };
}
