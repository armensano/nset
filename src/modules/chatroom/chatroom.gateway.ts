import {
  WebSocketGateway,
  SubscribeMessage,
  MessageBody,
  ConnectedSocket,
  WebSocketServer,
} from '@nestjs/websockets';
import { Socket, Server } from 'socket.io';
import { ChatroomService } from './chatroom.service';
// import { CreateChatroomDto } from './dto/create-chatroom.dto';
import { UpdateChatroomDto } from './dto/update-chatroom.dto';

@WebSocketGateway()
export class ChatroomGateway {
  @WebSocketServer()
  server: Server;

  constructor(private readonly chatroomService: ChatroomService) {}

  @SubscribeMessage('sendMessage')
  chat(@MessageBody() createChatroomDto) {
    this.server
      .to(createChatroomDto[0].chatId)
      .emit('sendMessage', createChatroomDto[0].message);
    console.log('chat');

    return createChatroomDto;
  }

  @SubscribeMessage('createChatroom')
  create(@MessageBody() createChatroomDto, @ConnectedSocket() client: Socket) {
    console.log('createChatroomDto: ', createChatroomDto);
    if (createChatroomDto[0]?.chatId) {
      client.join(createChatroomDto[0].chatId);
      client.emit(
        'createChatroom',
        `added to chatroom ${createChatroomDto[0].chatId}`,
      );
    }
  }

  @SubscribeMessage('leaveChatroom')
  leave(@MessageBody() leaveChatroom, @ConnectedSocket() client: Socket) {
    console.log('leaveChatroom: ', leaveChatroom);
    if (leaveChatroom[0]?.chatId) {
      client.leave(leaveChatroom[0].chatId);
      client.emit(
        'createChatroom',
        `left the chatroom ${leaveChatroom[0].chatId}`,
      );
    }
  }
}
