class Paciente < ActiveRecord::Base
	has_many :ams

	validates :primer_nombre,
	format: {with: /\A[a-zA-Z+ñáéíóúÑ\s]+\z/ , message: "Este campo solo acepta letras" }, 
	presence: { message: "Nombre inválido"}
	
	validates :apellido_paterno, 
	format: {with: /\A[a-zA-Z+ñáéíóúÑ\s]+\z/ , message: "Este campo solo acepta letras" }, 
	presence: { message: "Apellido paterno inválido"}
	validates :apellido_materno, 
	format: {with: /\A[a-zA-Z+ñáéíóúÑ\s]+\z/ , message: "Este campo solo acepta letras" }, 
	presence: {message: "Apellido materno inválido"}
	validates :dni, 
	presence: {message: "Este campo no puede quedar vacío"},  
	numericality: {only_integer: true, message:"Debe tener solo números" },
	length: {is: 8, message: "Debe tener 8 digitos"}
	validates :direccion, 
	presence: {message: "Este campo no puede quedar vacío"}
	validates :email,
	allow_blank:true,
	format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i , message: "Formato inválido, el formato debe ser mail@example.com" }
	validate :nacimiento_cannot_be_in_the_future

	def nacimiento_cannot_be_in_the_future
		if nacimiento > Date.today
			errors.add(:nacimiento, "La fecha de nacimiento no puede ser en el futuro")
		end
	end
end
