GravityService = GravityService or {}


-- # Properties

CreateConVar("emm_gravity", 300, FCVAR_REPLICATED, "Player gravity.")

function GravityService.GetDefaultGravity()
	return GetConVar("emm_gravity"):GetFloat()
end

function GravityService.InitPlayerProperties(ply)
	ply.gravity = 300
end
hook.Add(
	SERVER and "InitPlayerProperties" or "InitLocalPlayerProperties",
	"GravityService.InitPlayerProperties",
	GravityService.InitPlayerProperties
)


-- # Gravity

function GravityService.Velocity(ply, move)
	local gravity = Vector(0, 0, (ply.gravity * FrameTime()))

	return move:GetVelocity() - gravity
end

function GravityService.SetupGravity(ply, move)
	if not ply.lobby and ply.gravity != GravityService.GetDefaultGravity() then
		ply.gravity = GravityService.GetDefaultGravity()
	end

	if GetConVar("sv_gravity"):GetFloat() != 0 then
		local mult = GetConVar("sv_gravity"):GetFloat()/(GravityService.GetDefaultGravity() * 200)

		ply:SetGravity(mult)
		move:SetVelocity(move:GetVelocity() + Vector(0, 0, GravityService.GetDefaultGravity() * mult * FrameTime()))
	end

	if ply:WaterLevel() > 1 or ply.gravity == 0 then return end
	move:SetVelocity(GravityService.Velocity(ply, move))
end
hook.Add("SetupMove", "GravityService.SetupGravity", GravityService.SetupGravity)
