local THEME_TYPES = {
	success = "SUCCESS",
	neutral = "INFO",
	warning = "WARNING",
	error = "ERROR",
	info = "PRIMARY",
	phonemessage = "INFO"
}

function Alert(title, text, timeout, theme)
	local options = {
		title = title,
		text = text,
		timeout = timeout,
		theme = THEME_TYPES[theme] or "INFO"
	}
	
	local notified = pcall(function()
		exports.np_notify:notify(options)
	end)

	if(not notified) then
		TriggerEvent("np_notify:notify", options)
	end
end

exports('Alert', Alert)
RegisterNetEvent('okokNotify:Alert', Alert)