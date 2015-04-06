class AmPdf < Prawn::Document

	def initialize(am)
		super(top_margin: 70)
		@am = am
		am_fecha
		line_items
	end

	def am_fecha
		text "Análisis \##{@am.fecha}", size: 25, type: :helvetica 		
	end

	def line_items
		move_down 20
		table line_item_rows do
			column(0).font_style = :bold
			columns(1..3).align = :right
			# self.row_colors = ["3498db" , "1abc9c"]
			self.header = true

		end	
	end
	
	# def line_item_rows
	# 	[["Hto", "Hb", "Peso_pre", "Peso_post", "urea_pre", "urea_post", "urr", "ktv", "tgp", "tgo" ]]+
	# 	[[@am.hto, @am.hb, @am.peso_pre, @am.peso_post, @am.urea_pre, @am.urea_post, @am.urr, @am.ktv, @am.tgp, @am.tgo]]
	# end
	def line_item_rows
		[["Hto",@am.hto]]+ 
		[["Hb",@am.hb]]+ 
		[["Peso_pre",@am.peso_pre]]+ 
		[["Peso_post",@am.peso_post]]+ 
		[["urea_pre",@am.urea_pre]]+ 
		[["urea_post",@am.urea_post]]+ 
		[["urr",@am.urr]]+ 
		[["ktv",@am.ktv]]+ 
		[["tgp",@am.tgp]]+ 
		[["tgo", @am.tgo]]
	end

end

