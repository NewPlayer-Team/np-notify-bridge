local THEME_TYPES = {
	success = "SUCCESS",
	info = "INFO",
	warning = "WARNING",
	error = "ERROR",
	alert = "PRIMARY",
}

function SendNotification(options)
	local options = {
		title = data.text,
		text = data.text or "",
		timeout = data.timeout or 5000,
		theme = THEME_TYPES[data.type] or "INFO"
	}
	
	local notified = pcall(function()
		exports.np_notify:notify(options)
	end)

	if(not notified) then
		TriggerEvent("np_notify:notify", options)
	end
end

exports('SendNotification', SendNotification)
RegisterNetEvent('pNotify:SendNotification', SendNotification)