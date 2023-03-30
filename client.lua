Citizen.CreateThread(function()
	local shake_counter1 = 0
	local shake_counter2 = 0

	while IsPlayerFreeAiming(PlayerId()) do
		Citizen.Wait(0)
		SetCanAttackFriendly(GetPlayerPed(-1), true, false)
		NetworkSetFriendlyFireOption(true)
		SetWeaponsNoAutoreload(off)
	
		if IsPedStill(GetPlayerPed(-1)) then
			Citizen.Wait(100)
			shake_counter1 = shake_counter1 + 1
			shake_counter2 = 0
			if (shake_counter1 == 5) then 
				ShakeGameplayCam('HAND_SHAKE', Config.shakestill) 
			end
		elseif not IsPedStill(GetPlayerPed(-1)) then
			Citizen.Wait(10)
			shake_counter2 = shake_counter2 + 1
			shake_counter1 = 0
			if (shake_counter2 == 5) then 
				ShakeGameplayCam('HAND_SHAKE', Config.shakemovement) 
			end
		else
			StopGameplayCamShaking(true)
			shake_counter1 = 0
			shake_counter2 = 0
		else
			shake_counter1 = 0
			shake_counter2 = 0
			StopGameplayCamShaking(true)
		end
	end
end)