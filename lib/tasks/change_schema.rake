namespace :change_schema do
  task setup_logger: :environment do
    logger           = Logger.new(STDOUT)
    logger.level     = Logger::INFO
    Rails.logger     = logger
  end

  desc "change the project owner fields (organization or investor)"
  task :add_projects_to_investors, [:environment]  => :setup_logger do
    Rails.logger.info "Loooking for old schema in Projects <<- END"

    Project.all.each do |project|
      if project.has_attribute?(:organization_id) && (not project.organization_id.nil?)
        Rails.logger.info "Field identified: #{project.id}"
        project.projectable_id = project.organization_id
        project.projectable_type = "Organization"
        project.save
        Rails.logger.info "Field migrated successfully: #{project.id}"
      end
    end

    Rails.logger.info "END"
  end

end
