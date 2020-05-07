-- Type write for the chat channel
NetService.type_writers.chat_channel = NetService.type_writers.obj_id

--- Type reader for chat channel
NetService.type_readers.chat_channel = function()
    return ChatService.channels[NetService.ReadID()]
end

-- Signal name - {Schema Description}

-- Server -> Client
-- CreateVoiceChannel: {ChannelID: obj_id, Creator: player, isPrivate: bool}
NetService.CreateSchema("CreateVoiceChannel", {"chat_channel", "entity", "bool"})
-- CreateTextChannel: {ChannelID: obj_id, Creator: player, isPrivate: bool}
NetService.CreateSchema("CreateTextChannel", {"chat_channel", "entity", "bool"})
--UpdatePlayerChatFlags: {ChannelID: obj_id, Who: entity, Flags: uint8}
NetService.CreateUpstreamSchema("UpdatePlayerChatFlags", {"chat_channel", "entity", "id"})

-- DestroyChannel: {ChannelID: obj_id}
NetService.CreateSchema("DestroyChannel", {"chat_channel"})
-- SendChannelInvite: {ChannelID: obj_id}
NetService.CreateSchema("SendChannelInvite", {"chat_channel"})
-- PlayerJoinChannel: {ChannelID: obj_id, Who: player}
NetService.CreateSchema("PlayerJoinChannel", {"chat_channel", "entity"})
-- PlayerLeaveChannel: {ChannelID: obj_id, Who: player}
NetService.CreateSchema("PlayerLeaveChannel", {"chat_channel", "entity"})

-- Client -> Server
-- ReqCreateVoiceChannel: {isPrivate: bool}
NetService.CreateUpstreamSchema("ReqCreateVoiceChannel", {"bool"})
-- ReqCreateTextChannel: {isPrivate: bool}
NetService.CreateUpstreamSchema("ReqCreateTextChannel", {"bool"})
-- ReqJoinChannel: {ChannelID: obj_id}
NetService.CreateUpstreamSchema("ReqJoinChannel", {"chat_channel"})
-- ReqChannelInvite: {ChannelID: obj_id, Who: entity}
NetService.CreateUpstreamSchema("ReqChannelInvite", {"chat_channel", "entity"})
-- ReqLeaveChannel: {ChannelID: obj_id}
NetService.CreateUpstreamSchema("ReqLeaveChannel", {"chat_channel"})
-- ReqChannelBanPlayer: {ChannelID: obj_id, Who: entity}
NetService.CreateUpstreamSchema("ReqChannelBanPlayer", {"chat_channel", "entity"})
-- ReqChannelSetFlags: {ChannelID: obj_id, Who: entity, Flag: uint8, Set: bool}
NetService.CreateUpstreamSchema("ReqChannelSetFlags", {"chat_channel", "entity", "id", "boolean"})