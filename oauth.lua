-- 12Gauge_Nick
-- 12/10/2021
-- Handles new 2.3 OAuth Twitch added in (April 2021)

local HttpService			 = game:GetService("HttpService")

local ClientId				 = script.Parent.ClientId.Value -- This value is okay to show by public
local ClientSecret			 = script.Parent.ClientSecret.Value -- This value not so much, DONT EVER SHOW THIS VALUE. However incase of a mishap you are able to generate a new one

local Url = "https://id.twitch.tv/oauth2/token?client_id="..ClientId.."&client_secret="..ClientSecret.."&grant_type=client_credentials&scope=bits:read"

return function()
	local Request = HttpService:RequestAsync({Url = Url,Method = "POST"})
	local OAuthCode = HttpService:JSONDecode(Request.Body).access_token
	assert(OAuthCode~=nil, "Error getting 2.0 OAuth code; check your ClientSecret and ClientId!")
	return OAuthCode
end
