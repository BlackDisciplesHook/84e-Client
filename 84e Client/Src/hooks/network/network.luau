-- this was never really needed but I guess I wanted to add it

local Shared = require("../../shared")
local ExpectedArguments = require("@self/expectedargs")

local Networking = {
	HookedOutgoingEvents = {},
	Blacklist = { "SelfReport" },
}

local NetworkClient = Shared.Modules:find("NetworkClient", true)
local NetworkEvents = Shared.Modules:find("NetworkEvents", true)

local FireToServer = (function()
	local upvalue = debug.getupvalue(NetworkClient.getEvent, 5)

	if typeof(upvalue) ~= "table" then
		return nil
	end

	for _, v in next, upvalue do
		return v
	end

	return nil
end)()

assert(typeof(FireToServer) == "function", "Failed to get FireToServer, report this error to the developer")

local OldFireToServer
OldFireToServer = hookfunction(FireToServer, LPH_NO_UPVALUES(function(event, ...)
	if table.find(Networking.Blacklist, event.eventName) then
		print("Prevented event from firing: -> ", event.eventName, "\nArguments: ->", unpack({...}), "\n", debug.traceback())
		return nil
	end

	local callback = Networking.HookedOutgoingEvents[event.eventName]
	if callback then
		local result = callback(...)

		if result == false then
			return nil
		end

		if typeof(result) == "table" then
			return OldFireToServer(event, table.unpack(result))
		end
	end

	return OldFireToServer(event, ...)
end))

function Networking:AddBlacklist(eventName)
	if typeof(eventName) ~= "string" then
		warn("Networking:AddBlacklist: eventName must be a string")
		return
	end

	if table.find(Networking.Blacklist, eventName) then
		warn("Networking:AddBlacklist: event already blacklisted ->", eventName)
		return
	end

	table.insert(Networking.Blacklist, eventName)
end

function Networking:RemoveBlacklist(eventName)
	if typeof(eventName) ~= "string" then
		warn("Networking:RemoveBlacklist: eventName must be a string")
		return
	end

	local index = table.find(Networking.Blacklist, eventName)
	if not index then
		warn("Networking:RemoveBlacklist: event not found ->", eventName)
		return
	end

	table.remove(Networking.Blacklist, index)
end

function Networking:FireEvent(eventName, ...)
	local arguments = { ... }

	if typeof(eventName) ~= "string" then
		warn("Networking:FireEvent: Argument #1 expects a string, but a:", typeof(eventName), "was passed")
		return
	end

	local info = NetworkEvents.getEventInfo(eventName)
	if not info then
		warn("Networking:FireEvent: No event of the name:", eventName, "was found")
		return
	end

	local clientDisabled = ExpectedArguments[eventName] and ExpectedArguments[eventName].clientDisabled
	if clientDisabled ~= nil and clientDisabled or info.clientDisabled then
		warn("Networking:FireEvent: This event cannot be fired on the client:", eventName)
		return
	end

	if info.usePlayerModel then
		local character = Shared.Classes.LocalPlayer.Character

		if not character then
			warn("Networking:FireEvent: No character is present for event:", eventName)
			return
		end

		table.insert(arguments, 1, character)
	end

	local event = NetworkClient.getEvent(eventName)
	if event then
		event:FireToServer(unpack(arguments))
	else
		warn("Networking:FireEvent: Failed to fetch event for:", eventName)
		return
	end
end

function Networking:HookEvent(eventName, callback)
	if typeof(eventName) ~= "string" then
		warn("Networking:HookEvent: Argument #1 expects a string, but a:", typeof(eventName), "was passed")
		return
	end

	local info = NetworkEvents.getEventInfo(eventName)
	if not info then
		warn("Networking:HookEvent: No event of the name:", eventName, "was found")
		return
	end

	if typeof(callback) ~= "function" then
		warn("Networking:HookEvent: Argument #2 expects a function, but a:", typeof(callback), "was passed")
		return
	end

	self.HookedOutgoingEvents[eventName] = callback
end

function Networking:UnhookEvent(eventName)
	if typeof(eventName) ~= "string" then
		warn("Networking:UnhookEvent: eventName must be a string")
		return
	end

	local index = table.find(Networking.HookedOutgoingEvents, eventName)
	if not index then
		warn("Networking:UnhookEvent: event not found ->", eventName)
		return
	end

	self.HookedOutgoingEvents[eventName] = nil
end

return Networking
