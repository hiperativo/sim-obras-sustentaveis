class Construction < ActiveRecord::Base
	attr_accessor :passo, :sistema, 
	:sistema_outros_enable,
	:tipo_de_sistema_outros_enable,
	:proximidade_ao_tpublico_outros_enable,
	:bacias_e_mictorios_outros_enable,
	:bacias_e_mictorios_outros
end
