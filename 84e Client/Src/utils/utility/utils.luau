local Utility = {
    GetCorners = function(Part)
        if typeof(Part) ~= "BasePart" then
            return nil
        end

        local Size = Part.Size / 2

        local Corners = {
            Vector3.new(-Size.X, -Size.Y, -Size.Z),
            Vector3.new(-Size.X, -Size.Y,  Size.Z),
            Vector3.new(-Size.X,  Size.Y, -Size.Z),
            Vector3.new(-Size.X,  Size.Y,  Size.Z),
            Vector3.new( Size.X, -Size.Y, -Size.Z),
            Vector3.new( Size.X, -Size.Y,  Size.Z),
            Vector3.new( Size.X,  Size.Y, -Size.Z),
            Vector3.new( Size.X,  Size.Y,  Size.Z),
        }

        return Corners
    end,

    Draw = function(class, properties)
        local success, instance = pcall(Drawing.new, class)

        if not success then
            return false
        end

        if properties then
            for key, value in next, properties do
                local succ, err = pcall(function()
                    (instance :: any)[key] = value
                end)

                if not succ then
                    warn(err)
                    return false
                end
            end
        end

        return instance
    end,

    Create = function(class, properties)
        local success, instance = pcall(Instance.new, class)

        if not success then
            return false
        end

        if properties then
            for key, value in next, properties do
                local succ, err = pcall(function()
                    (instance :: any)[key] = value
                end)

                if not succ then
                    warn(err)
                    return false
                end
            end
        end

        return instance
    end,

    SolveTrajectory = function(Origin, TargetPosition, TargetVelocityX, MuzzleVelocity) -- YO THANKS DEEPSEEK, MY BELOVED!!
        local ProjectileSpeed = MuzzleVelocity.Magnitude

        local ToTarget = TargetPosition - Origin
        local HorizontalDistance = Vector3.new(ToTarget.X, 0, ToTarget.Z).Magnitude

        local Time = HorizontalDistance / ProjectileSpeed
        local PredictedPosition = TargetPosition

        for i = 1, 15 do
            local Drop = 0.5 * 64 * Time * Time
            local MoveX = TargetVelocityX * Time

            PredictedPosition = Vector3.new(TargetPosition.X + MoveX, TargetPosition.Y + Drop, TargetPosition.Z)

            local NewToTarget = PredictedPosition - Origin
            local NewHorizontalDistance = Vector3.new(NewToTarget.X, 0, NewToTarget.Z).Magnitude

            Time = NewHorizontalDistance / ProjectileSpeed

            if i > 3 then
                local DropError = math.abs(PredictedPosition.Y - (TargetPosition.Y + 0.5 * 64 * Time * Time))
                if DropError < 0.1 then
                    break
                end
            end
        end

        local AimDirection = (PredictedPosition - Origin).Unit

        return {
            AimPosition = PredictedPosition,
            TimeToTarget = Time,
            AimDirection = AimDirection,
            DropCompensation = PredictedPosition.Y - TargetPosition.Y,
        }
    end,

    InRadius = function(position, targetposition, radius)
	    return (targetposition - position).Magnitude <= radius
    end,
}

return Utility