ChatService = ChatService or {}
ChatService.channels = ChatService.channels or {}

--- Add new voice channel
---@param channel_id uint8
---@param is_private bool | "Is the channel private?"
<<<<<<< HEAD
function ChatService.CreateVoiceChannel(channel_id, is_private)
=======
function ChatService.CreateVoiceChannel(channel_id, is_private, host)
>>>>>>> 69b29dfbaad1b789073abab07bdf29abbaf29239
    --- TODO: Update this statement when the voice channel class is complete
    ChatService.channels[channel_id] = VoiceChannelClass:New(is_private)
end 

--- Add new text channel
---@param channel_id uint8
---@param is_private bool | "Is the channel private?"
<<<<<<< HEAD
function ChatService.CreateTextChannel(channel_id, is_private)
    --- TODO: Update this statement when the text channel class is complete
    ChatService.channels[channel_id] = TextChannelClass:New(is_private)
=======
function ChatService.CreateTextChannel(channel_id, is_private, host)
    --- TODO: Update this statement when the text channel class is complete
    ChatService.channels[channel_id] = TextChannelClass:New(is_private)
end

--- Converts the packet to channels
function ChatService.PacketToChannels(packet_str)
    local channel_info = util.JSONToTable(util.Decompress(packet_str))
    for channel_id, channel_data in pairs(channel_info) do
        if channel_data.voice then
            local channel = ChatService.CreateVoiceChannel(channel_id, channel_data.private, Player(channel_data.host))
        else
            local channel = ChatService.CreateTextChannel(channel_id, channel_data.private, Player(channel_data.host))
        end
        for ply_id, flags in pairs(channel_tab.ply_flags) do
            channel.flags[Player(ply)] = flags
        end
    end
>>>>>>> 69b29dfbaad1b789073abab07bdf29abbaf29239
end