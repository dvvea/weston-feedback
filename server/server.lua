local webhookUrl = Config.DiscordWebhook

RegisterServerEvent('feedback:sendToDiscord')
AddEventHandler('feedback:sendToDiscord', function(name, feedbackType, feedback)
    local timestamp = os.date('%Y-%m-%d %H:%M:%S')

    local data = {
        username = 'Feedback Bot',
        embeds = {{
            title = 'New Feedback',
            description = mention,
            fields = {
                { name = 'Name', value = name, inline = false },
                { name = 'Type', value = feedbackType, inline = true },
                { name = 'Feedback', value = feedback, inline = false }
            },
            footer = {
                text = 'Submitted at ' .. timestamp
            },
            color = 000000
        }}
    }

    PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(data), { ['Content-Type'] = 'application/json' })
end)
