-- 12Gauge_Nick
-- 12/10/2021

--[[
	In the values below this script you need to enter your ClientId, ClientSecret, and YOUR account username! This API WILL LOGIN into your account!
	- DO NOT GIVE OUT YOUR CLIENT SECRET KEY!
]]

local module				 = {}

local OAuthCode		 		 = require(script.GetOAuth)()

local ClientId				 = script.ClientId.Value
local ClientSecret	 		 = script.ClientSecret.Value
local ClientAccountName		 = script.ClientAccountName.Value

local HttpService			 = game:GetService("HttpService")

local GetTwitchData = function(Request)
	return HttpService:JSONDecode(Request.Body).data[1]
end

local DoChannelSearch = function(ChannelName)
	ChannelName = ChannelName:lower()
	if not ChannelName then ChannelName = ClientAccountName end
	local Request = HttpService:RequestAsync({Url = "https://api.twitch.tv/helix/search/channels?query="..ChannelName,Method = "GET",Headers = {["client-id"] = ClientId,["Authorization"] = "Bearer "..OAuthCode,["Content-Type"] = "application/json"}})
	if Request.StatusCode == 200 then
		return Request
	else
		warn("[Helix]:",Request.StatusCode,Request.Body)
		return false
	end
end

local GetAdvancedStreamData = function(ChannelName)
	ChannelName = ChannelName:lower()
	if not ChannelName then ChannelName = ClientAccountName end
	local Request = HttpService:RequestAsync({Url = "https://api.twitch.tv/helix/streams?user_login="..ChannelName,Method = "GET",Headers = {["client-id"] = ClientId,["client-secret"] = ClientSecret,["Authorization"] = "Bearer "..OAuthCode,["Content-Type"] = "application/json"}})
	if Request.StatusCode == 200 then
		return GetTwitchData(Request)
	else
		warn("[Helix]:",Request.StatusCode,Request.Body)
		return {}
	end
end

local GetGameIdByName = function(GameName)
	local Request = HttpService:RequestAsync({Url = "https://api.twitch.tv/helix/games?name="..GameName,Method = "GET",Headers = {["client-id"] = ClientId,["Authorization"] = "Bearer "..OAuthCode,["Content-Type"] = "application/json"}})
	if Request.StatusCode == 200 then
		return GetTwitchData(Request)
	end
	return 493057
end

local GetTopGameByGame = function(GameName)
	local GameId = GetGameIdByName(GameName).id
	local Request = HttpService:RequestAsync({Url = "https://api.twitch.tv/helix/streams?game_id="..GameId,Method = "GET",Headers = {["client-id"] = ClientId,["Authorization"] = "Bearer "..OAuthCode,["Content-Type"] = "application/json"}})
	if Request.StatusCode == 200 then
		local TwitchData = GetTwitchData(Request)
		return{thumbnail_url = TwitchData.thumbnail_url,user_name = TwitchData.user_name,title = TwitchData.title,started_at = TwitchData.started_at,game_name = TwitchData.game_name,viewer_count = TwitchData.viewer_count,}
	else
		warn("[Helix]:",Request.StatusCode,Request.Body)
		return {}
	end
end

function module.GetGameInfo(GameName: string)
	return GetGameIdByName(GameName)
end

function module.GetTopGameStreamer(GameName: string)
	return GetTopGameByGame(GameName)
end

function module.GetRawStreamData(ChannelName: string)
	return GetAdvancedStreamData(ChannelName)
end

function module.DoChannelSearch(ChannelName: string)
	return DoChannelSearch(ChannelName)
end

function module.GetCurrentGame(ChannelName: string)
	return GetAdvancedStreamData(ChannelName).game_name
end

function module.GetViewership(ChannelName: string)
	return GetAdvancedStreamData(ChannelName).viewer_count
end

function module.GetLiveStatus(ChannelName: string)
	local isLive = GetAdvancedStreamData(ChannelName)
	if isLive == nil or isLive.type ~= "live" then
		return false
	end
	return true
end

function module.GetTitle(ChannelName: string)
	return GetAdvancedStreamData(ChannelName).title
end

function module.GetThumbnail(ChannelName: string)
	return GetAdvancedStreamData(ChannelName).thumbnail_url
end

return module