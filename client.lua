CreateThread(function()
	local shake_counter1 = 0
	local shake_counter2 = 0

	while true do
		Wait(3)
		local PlayerId = PlayerId()
		local PlayerPed = PlayerPedId()
		if IsPlayerFreeAiming(PlayerId) and IsPedStill(PlayerPed) and not IsPedAimingFromCover(PlayerPed) then
			Wait(100)
			shake_counter1 = shake_counter1 + 1
			shake_counter2 = 0
			if (shake_counter1 == 5) then 
				ShakeGameplayCam('HAND_SHAKE', Config.shakestill) 
			end
		elseif IsPlayerFreeAiming(PlayerId) and not IsPedStill(PlayerPed) then
			Wait(10)
			shake_counter2 = shake_counter2 + 1
			shake_counter1 = 0
			if (shake_counter2 == 5) then 
				ShakeGameplayCam('HAND_SHAKE', Config.shakemovement) 
			end
		elseif IsPedAimingFromCover(PlayerPed) then
			StopGameplayCamShaking(true)
			shake_counter1 = 0
			shake_counter2 = 0
		else
			shake_counter1 = 0
			shake_counter2 = 0
			StopGameplayCamShaking(true)
			Wait(500)
		end
	end
end)
