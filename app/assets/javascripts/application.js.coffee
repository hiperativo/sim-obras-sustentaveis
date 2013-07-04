#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require conditional_fields
#= require cidades_estados
#= require jquery.ui.all

class CitiesLoader
	constructor: (options) ->
		options.city_selector.html "<option>Selecione o estado</option>"
		options.state_selector.change (e) =>
			cidades_atuais = ""
			cidades_atuais += for cidade in options.data[$(e.target).val()].cidades
				"<option value=\"#{cidade}\">#{cidade}</option>"
			options.city_selector.html cidades_atuais

$ ->
	if $(".warn-before-leaving").size()
		$(window).bind 'beforeunload', ->
			"Os dados ainda não foram salvos. Tem certeza que deseja ir para outra página?"

		$(".warn-before-leaving").submit ->
			$(window).unbind 'beforeunload'

	$(".filter").keyup (e)->
		hay = new RegExp $(e.target).val(), "i"
		$("[data-cell]").each ->
			search = String($(this).data().cell).match(hay)
			$(this).parent().show()
			if search
				console.log search.length, hay
			else
				$(this).parent().hide()

	if $(".conditional-fields").size() > 0
		new ConditionalFields $(".conditional-fields").first()

	if $("#construction_cidade").size()
		new CitiesLoader 
			data: cidades_estados
			state_selector: $("#construction_estado")
			city_selector: $("#construction_cidade")

	$(".datepicker").datepicker
		changeYear: true
		changeMonth: true
		dateFormat: "dd/mm/yy"
		yearRange: "1980:2020"

	$("[data-passo]").click ->
		passo = $(this).data().passo
		$("fieldset").hide()
		$("[data-passo]").parent().removeClass("active")
		$(this).parent().addClass("active")
		$("#"+passo).show()
		window.history.pushState "", "", "?passo=#{passo}"

		if $(".progress .bar").size()
			passos = $(".progress").data().passos
			$(".progress .bar").width (( (passos.indexOf(passo) + 1)/passos.length)*100)+"%"
			$(".progress .passo-atual").html passos.indexOf(passo)+1
		false
