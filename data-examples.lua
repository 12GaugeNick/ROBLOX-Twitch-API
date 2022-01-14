--[[
	module.GetGameInfo("fortnite") : table
		{
         ["box_art_url"] = "https://static-cdn.jtvnw.net/ttv-boxart/33214-{width}x{height}.jpg",
         ["id"] = "33214",
         ["name"] = "Fortnite"
        }
        
    module.GetTopGameStreamer("fortnite") : table
    	{
         ["game_name"] = "Fortnite",
         ["started_at"] = "2022-01-01T15:38:48Z",
         ["thumbnail_url"] = "https://static-cdn.jtvnw.net/previews-ttv/live_user_mongraal-{width}x{height}.jpg",
         ["title"] = "Happy new year : D / code mongraal #ad (pls use)",
         ["user_name"] = "Mongraal",
         ["viewer_count"] = 22133
        }
        
    module.GetRawStreamData("12Gauge_Nick") : table
        {
         ["game_id"] = "23020",
         ["game_name"] = "Roblox",
         ["id"] = "44990765133",
         ["is_mature"] = false,
         ["language"] = "en",
         ["started_at"] = "2022-01-01T22:13:51Z",
         ["tag_ids"] =  ▶ {...},
         ["thumbnail_url"] = "https://static-cdn.jtvnw.net/previews-ttv/live_user_12gauge_nick-{width}x{height}.jpg",
         ["title"] = "Twitch API testing",
         ["type"] = "live",
         ["user_id"] = "613448415",
         ["user_login"] = "12gauge_nick",
         ["user_name"] = "12Gauge_Nick",
         ["viewer_count"] = 0
        }
        
    module.DoChannelSearch("12GaugeNick") : table
    	{
         ["Body"] = "{"data":[{"broadcaster_language":"","broadcaster_login":"12gaugenic","display_name":"12Gaugenic","game_id":"0","game_name":"","id":"37852161","is_live":false,"tag_ids":[],"thumbnail_url":"https://static-cdn.jtvnw.net/user-default-pictures-uv/de130ab0-def7-11e9-b668-784f43822e80-profile_image-300x300.png","title":"","started_at":""},{"broadcaster_language":"","broadcaster_login":"12gauge_ninja","display_name":"12gauge_ninja","game_id":"0","game_name":"","id":"85464759","is_live":false,"tag_ids":[],"thumbnail_url":"https://static-cdn.jtvnw.net/user-default-pictures-uv/998f01ae-def8-11e9-b95c-784f43822e80-profile_image-300x300.png","title":"","started_at":""},{"broadcaster_language":"en","broadcaster_login":"12gaugenick","display_name":"12GaugeNick","game_id":"27471","game_name":"Minecraft","id":"92079224","is_live":false,"tag_ids":[],"thumbnail_url":"https://static-cdn.jtvnw.net/jtv_user_pictures/12gaugenick-profile_image-f571135a7f88f492-300x300.png","title":"Testing ^ 3","started_at":""},{"broadcaster_language":"en","broadcaster_login":"12gauge_nick","display_name":"12Gauge_Nick","game_id":"23020","game_name":"Roblox","id":"613448415","is_live":true,"tag_ids":["6ea6bca4-4712-4ab9-a906-e3336a9d8039"],"thumbnail_url":"https://static-cdn.jtvnw.net/jtv_user_pictures/2b44bb8f-a65b-4d98-b78b-d28af4682dd0-profile_image-300x300.png","title":"Twitch API testing","started_at":"2022-01-01T22:13:51Z"},{"broadcaster_language":"","broadcaster_login":"12gaugekickz","display_name":"12gaugekickz","game_id":"0","game_name":"","id":"674932555","is_live":false,"tag_ids":[],"thumbnail_url":"https://static-cdn.jtvnw.net/user-default-pictures-uv/ebb84563-db81-4b9c-8940-64ed33ccfc7b-profile_image-300x300.png","title":"","started_at":""}],"pagination":{}}",
         ["Headers"] =  ▶ {...},
         ["StatusCode"] = 200,
         ["StatusMessage"] = "OK",
         ["Success"] = true
        }
        
    module.GetCurrentGame("12Gauge_Nick") : string
        Roblox
        
    module.GetViewership("12Gauge_Nick") : string
    	999
    
    module.GetLiveStatus("12Gauge_Nick") : boolean
    	false
    	
    module.GetThumbnail("12Gauge_Nick") : string
        https://static-cdn.jtvnw.net/user-default-pictures-uv/de130ab0-def7-11e9-b668-784f43822e80-profile_image-300x300.png
        
    module.GetTitle("12Gauge_Nick") : string
    	Twitch API Testing
    	
    module.GetLiveStatus("12Gauge_Nick") : boolean
    	true/false
]]
return {}
