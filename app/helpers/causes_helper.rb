module CausesHelper
  def causes_list(file='data/causes.yml')
    require 'yaml'

    causes = []

    if File.exist? file
      data = YAML.load_file(file)

      data.values.each do |e|
        causes.push(*e["causas"]) if e.has_key? "causas"
      end
    end

    causes
  end
end
