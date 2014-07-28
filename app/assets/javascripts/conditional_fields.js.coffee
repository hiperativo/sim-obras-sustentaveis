class ConditionalFields
	constructor: (form_element) ->
		@conditional_fields = []
		@form_object = form_element.data("object")
		do @get_fields
		do @setup_fields

	get_fields: =>
		@conditional_fields = $("[data-requires]")

	setup_fields: => 
		@conditional_fields.each (index, conditional_field) =>
			required_element_name = $(conditional_field).data("requires")
			desired_value = $(conditional_field).data("desires")
			desired_value ?= true
			required_element = $("[name='#{@form_object}[#{required_element_name}]']").first()
			exactly = $(conditional_field).data().requiresExactly
			required_element = required_element.filter(exactly) if exactly?
			required_element.change (e) =>

				if @check_conditions(e.currentTarget, desired_value) 
					@show conditional_field
				else 
					@hide(conditional_field)

			required_element.change()

	check_conditions: (field, value) =>
		field_type = $(field).attr "type"
		value is switch field.tagName
			when "INPUT" then switch field_type
				when "checkbox" 
					field.checked
				when "radio" 
					$("input[name='"+$(field).attr("name")+"']:checked").val()
				else $(field).text()
			when "SELECT" then $(field).find(":selected").attr("value")

	show: (field) =>
		$(field).show()

	hide: (field) =>
		$(field).hide()

@ConditionalFields = ConditionalFields