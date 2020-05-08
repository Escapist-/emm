ChatService = ChatService or {}
ChatService.channels = ChatService.channels or {}
ChatService.flag.OP = 1
ChatService.flag.MUTED = 1<<1

--- Remove channel from the channel list
---@param channel_id uint8
function ChatService:DestroyChannel(channel_id)
    if(self.channels[channel_id]) then
        self.channels[channel_id] = nil
    end
end