module MunicipiosHelper
  def municipal_list(file='data/municipios.yml')
    require 'yaml'

    municipios = []

    if File.exist? file
      data = YAML.load_file(file)

      data.values.each do |e|
        municipios.push(*e["municipios"]) if e.has_key? "municipios"
      end
    end

    municipios
  end
end
