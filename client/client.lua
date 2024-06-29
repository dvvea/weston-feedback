function showFeedbackDialog()
    local input = lib.inputDialog('Feedback Form', {
        { type = 'input', label = 'Name', placeholder = 'Enter your name', required = true },
        { type = 'select', label = 'Feedback Type', options = {
            { value = 'bug', label = 'Bug Report' },
            { value = 'suggestion', label = 'Suggestion' },
            { value = 'compliment', label = 'Compliment' }
        }, placeholder = 'Select feedback type', required = true },
        { type = 'textarea', label = 'Feedback', placeholder = 'Enter your feedback', required = true, min = 5, max = 10 }
    })

    if not input then return end

    local name = input[1]
    local feedbackType = input[2]
    local feedback = input[3]

    TriggerServerEvent('feedback:sendToDiscord', name, feedbackType, feedback)
end

RegisterCommand('feedback', function()
    showFeedbackDialog()
end, false)
