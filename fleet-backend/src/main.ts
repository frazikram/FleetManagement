import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const config = new DocumentBuilder()
    .setTitle('Fleet API')
    .setDescription('Uber-style fleet management API')
    .setVersion('1.0.0')
     // TODO .addBearerAuth() uncomment if using JWT soon
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document, {
    jsonDocumentUrl: 'api-json', // exposes /api-json
  });
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();
