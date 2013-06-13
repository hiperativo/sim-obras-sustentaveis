#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require conditional_fields

$ ->
	if $(".conditional-fields").size() > 0
		new ConditionalFields $(".conditional-fields").first()