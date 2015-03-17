json.array!(@ams) do |am|
  json.extract! am, :id, :hto, :hb, :peso_pre, :peso_post, :urea_pre, :urea_post, :urr, :ktv, :tgp, :tgo, :fecha, :paciente_id
  json.url am_url(am, format: :json)
end
