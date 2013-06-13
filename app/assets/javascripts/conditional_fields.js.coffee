class ConditionalFields
	constructor: (form_element) ->
		@conditional_fields = []
		@form_object = form_element.attr("id")
		do @get_fields
		do @setup_fields

	get_fields: =>
		@conditional_fields = $("[data-requires]")

	setup_fields: => 
		@conditional_fields.hide()
		@conditional_fields.each (index, conditional_field) =>
			required_element_name = $(conditional_field).data("requires")
			required_element = $("#" + @form_object + "_" + required_element_name)

			required_element.change (e) =>
				if @check_conditions(e.target, true) 
					@show conditional_field
				else 
					@hide conditional_field

	check_conditions: (field, value) =>
		field_type = $(field).attr "type"
		value == switch field_type
			when "checkbox" then field.checked

	show: (field) =>
		$(field).show()

	hide: (field) =>
		$(field).hide()



@ConditionalFields = ConditionalFields