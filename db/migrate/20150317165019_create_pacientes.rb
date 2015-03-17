class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.date :nacimiento
      t.string :dni
      t.string :direccion
      t.string :distrito
      t.string :provincia
      t.string :departamento
      t.string :email

      t.timestamps null: false
    end
  end
end
