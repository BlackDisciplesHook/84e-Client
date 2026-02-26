local Services = {}

for _, Service in next, {"Players", "RunService", "UserInputService", "CoreGui", "TweenService", "Debris"} do
   Services[Service] = cloneref(game:GetService(Service)) 
end

return Services