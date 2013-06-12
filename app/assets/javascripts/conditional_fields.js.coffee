class ConditionalFields
	constructor: ->
		console.log "conditional fields initialized"
		@get ->
			do @hide
			do @set_to_appear

	get: => @conditional_fields = $("[data-depends]")
	hide: => @conditional_fields?.hide()
	set_to_appear: =>
		null

@ConditionalFields = ConditionalFields