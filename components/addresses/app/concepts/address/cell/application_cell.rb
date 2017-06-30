module Address
  module Cell
    class ApplicationCell < ::Trailblazer::Cell
      layout :application
      self.view_paths = ["#{WaterBan::Addresses::Engine.root}/app/concepts"]
    end
  end
end
