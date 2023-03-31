Citizen.CreateThread(function()
	local shake_counter1 = 0
	local shake_counter2 = 0
	local PlayerId = PlayerId(-1)
	local PlayerPed = PlayerPedId(-1)

	while true do
		Citizen.Wait(0)
	
		if IsPlayerFreeAiming(PlayerId) and IsPedStill(PlayerPed) and not IsPedAimingFromCover(PlayerPed) then
			Citizen.Wait(100)
			shake_counter1 = shake_counter1 + 1
			shake_counter2 = 0
			if (shake_counter1 == 5) then 
				ShakeGameplayCam('HAND_SHAKE', Config.shakestill) 
			end
		elseif IsPlayerFreeAiming(PlayerId) and not IsPedStill(PlayerPed) then
			Citizen.Wait(10)
			shake_counter2 = shake_counter2 + 1
			shake_counter1 = 0
			if (shake_counter2 == 5) then 
				ShakeGameplayCam('HAND_SHAKE', Config.shakemovement) 
			end
			shake_counter1 = 0
			shake_counter2 = 0
			StopGameplayCamShaking(true)
		end
	end
end)
