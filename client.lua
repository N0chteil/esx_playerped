ESX = nil

local coord = {
        {459.1, -1007.8, 27.2,"Auto-Police",88.5,0x5E3DA4A4,"s_m_y_cop_01"},
		{-2343.5, 3339.0, 31.9,"army-Garage",322.2,0xD768B228,"s_m_m_security_01"},
		{-173.4, 218.5, 88.9,"Sex-Shop_Security",183.8,0xD768B228,"s_m_m_security_01"},
		{-172.6, 229.7, 87.0,"Sex-Shop_Seller",93.1,0x52580019,"s_f_y_stripper_01"},
		{-546.4, -206.2, 37.2,"Rathaus-Security_Links",218.4,0x625D6958,"s_m_m_ciasec_01"},
		{-542.6, -203.9, 37.2,"Rathaus-Security_Rechts",198.0,0x625D6958,"s_m_m_ciasec_01"},
		{484.6, -1318.1, 28.2,"Impounder_1",63.5,0x9E80D2CE,"s_m_m_lathandy_01"},
		
		{-655.2, 903.93, 227.1,"Auto",360.0,0x3B96F23E,"s_m_y_valet_01"},
		{-2264.7487792969, 3419.2016601563, 32.885677337646,"Auto",360.0,0x3B96F23E,"s_m_y_valet_01"},
		{-1511.6556396484, 5009.875, 62.800533294678,"Auto",360.0,0x3B96F23E,"s_m_y_valet_01"},
		{1501.2, 3762.19, 34.0,"Auto",360.0,0x3B96F23E,"s_m_y_valet_01"},
		{-977.21661376953, -2710.3798828125, 13.853487014771,"Auto",360.0,0x3B96F23E,"s_m_y_valet_01"},
		{-1684.8, 57.0, 64.0,"Auto",360.0,0x3B96F23E,"s_m_y_valet_01"},
		{638.287, 206.339, 96.6,"Auto",253.1,0x3B96F23E,"s_m_y_valet_01"},
		{-3137.6, 1125.7, 20.6,"Auto",360.0,0x3B96F23E,"s_m_y_valet_01"}
    }
    
    Citizen.CreateThread(function()
    
        for _,v in pairs(coord) do
          RequestModel(GetHashKey(v[7]))
          while not HasModelLoaded(GetHashKey(v[7])) do
            Wait(1)
          end
      
          RequestAnimDict("mini@strip_club@idles@bouncer@base")
          while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
            Wait(1)
          end
          ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
          SetEntityHeading(ped, v[5])
          FreezeEntityPosition(ped, true)
          SetEntityInvincible(ped, true)
          SetBlockingOfNonTemporaryEvents(ped, true)
          TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
        end
    end)

    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(100)
        end
    end)