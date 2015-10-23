CAUSES = Array.new
File.open("#{Rails.root}/config/causes.txt", 'r') do |f1|  
  while line = f1.gets  
    CAUSES.push(line)  
  end  
end 