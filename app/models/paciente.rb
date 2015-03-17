class Paciente < ActiveRecord::Base
	has_many :analisismensuals

	validates :primer_nombre, 
	presence: { message: "Nombre inválido"}
	validates :apellido_paterno, 
	presence: { message: "Apellido paterno inválido"}
	validates :apellido_materno, 
	presence: {message: "Apellido materno inválido"}
	validates :dni, 
	presence: {message: "Este campo no puede quedar vacío"}, 
	uniqueness: { case_sensitive: true }, 
	length: {is: 8, message: "Debe tener 8 digitos"} 
	validates :email,
	format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
end
