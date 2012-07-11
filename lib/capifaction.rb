Dir.glob(File.join(File.dirname(__FILE__), '/capifaction/*.rb')).sort.each { |f| load f }
