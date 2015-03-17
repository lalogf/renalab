json.array!(@pacientes) do |paciente|
  json.extract! paciente, :id, :primer_nombre, :segundo_nombre, :apellido_paterno, :apellido_materno, :nacimiento, :dni, :direccion, :distrito, :provincia, :departamento, :email
  json.url paciente_url(paciente, format: :json)
end
