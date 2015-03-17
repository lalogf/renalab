class CreateAms < ActiveRecord::Migration
  def change
    create_table :ams do |t|
      t.decimal :hto
      t.decimal :hb
      t.decimal :peso_pre
      t.decimal :peso_post
      t.decimal :urea_pre
      t.decimal :urea_post
      t.decimal :urr
      t.decimal :ktv
      t.decimal :tgp
      t.decimal :tgo
      t.date :fecha
      t.references :paciente, index: true

      t.timestamps null: false
    end
    add_foreign_key :ams, :pacientes
  end
end
