namespace :magento do
  namespace :maintenance do
    desc "Turn on maintenance mode by creating maintenance.flag file"
    task :on do
      on roles(:app) do
        within release_path do
          execute :touch, "#{release_path}/maintenance.flag"
        end
      end
    end

    desc "Turn off maintenance mode by removing maintenance.flag file"
    task :off do
      on roles(:app) do
        within release_path do
          execute :rm, "-f", "#{release_path}/maintenance.flag"
        end
      end
    end
  end
end
