module ProjectsHelper
  def retrive_projects_with(texts)
    texts.map do |text|
      Project.multisearch(text)
    end.flatten
  end
end