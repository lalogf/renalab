class Am < ActiveRecord::Base
	belongs_to :paciente

	validates :hto, 
	presence: { message: "Incluir HTO"}
	validates :hb, 
	presence: { message: "Incluir HB"}
	validates :peso_pre, 
	presence: { message: "Incluir Peso-pre"}
	validates :peso_post, 
	presence: { message: "Incluir Peso-post"}
	validates :urea_pre, 
	presence: { message: "Incluir Urea-pre"}
	validates :urea_post, 
	presence: { message: "Incluir Urea-post"}
	validates :urr, 
	presence: { message: "Incluir URR"}
	validates :ktv, 
	presence: { message: "Incluir KTV"}
	validates :tgp, 
	presence: { message: "Incluir TGP"}
	validates :tgo, 
	presence: { message: "Incluir TGO"}


	validate :fecha_cannot_be_in_the_future,

	def fecha_cannot_be_in_the_future
		if fecha > Date.today
			errors.add(:fecha, "no puede ser en el futuro")
		end
	end
end
