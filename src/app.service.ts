import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): object {
    debugger;
    return { message: "Let's go further!" };
  }
}
