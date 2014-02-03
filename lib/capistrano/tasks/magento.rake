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

  namespace :compiler do
    desc "Run compilation process and enable compiler include path"
    task :compile do
      on roles(:app) do
        within "#{release_path}/shell" do
          execute :php, "-f", "compiler.php", "--", "compile"
        end
      end
    end

    desc "Enable compiler include path"
    task :enable do
      on roles(:app) do
        within "#{release_path}/shell" do
          execute :php, "-f", "compiler.php", "--", "enable"
        end
      end
    end

    desc "Disable compiler include path"
    task :disable do
      on roles(:app) do
        within "#{release_path}/shell" do
          execute :php, "-f", "compiler.php", "--", "disable"
        end
      end
    end

    desc "Disable compiler include path and remove compiled files"
    task :clear do
      on roles(:app) do
        within "#{release_path}/shell" do
          execute :php, "-f", "compiler.php", "--", "clear"
        end
      end
    end
  end
end

namespace :load do
  task :defaults do
    set :linked_dirs, fetch(:linked_dirs, []).push("var", "media", "sitemaps")
    set :linked_files, fetch(:linked_files, []).push("app/etc/local.xml")
  end
end
