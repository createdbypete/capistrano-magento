namespace :magento do
  namespace :cache do

      desc "Clear the Magento Cache"
      task :clear do
        on roles(fetch(:magento_roles)) do
          within fetch(:magento_working_dir) do
            execute :php, "-r", "\"require_once('app/Mage.php'); Mage::app()->cleanCache(); \""
          end
        end
      end

      desc "Flush the Magento Cache Storage"
      task :flush do
        on roles(fetch(:magento_roles)) do
          within fetch(:magento_working_dir) do
            execute :php, "-r", "\"require_once('app/Mage.php'); Mage::dispatchEvent('adminhtml_cache_flush_all'); Mage::app()->getCacheInstance()->flush(); \""
          end
        end
      end

      desc "Clean Merged Js Css"
      task :clean_merged_js_css do
        on roles(fetch(:magento_roles)) do
          within fetch(:magento_working_dir) do
            execute :php, "-r", "\"require_once('app/Mage.php'); Mage::app()->setCurrentStore(Mage_Core_Model_App::ADMIN_STORE_ID); Mage::getModel('core/design_package')->cleanMergedJsCss();  Mage::dispatchEvent('clean_media_cache_after'); \""
          end
        end
      end

      desc "Clean the Magento external Page Cache"
      task :clean_page_cache do
        on roles(fetch(:magento_roles)) do
          within fetch(:magento_working_dir) do
            execute :php, "-r", "\"require_once('app/Mage.php'); Mage::app()->setCurrentStore(Mage_Core_Model_App::ADMIN_STORE_ID); if (Mage::helper('pagecache')->isEnabled()) { Mage::helper('pagecache')->getCacheControlInstance()->clean(); } \""
          end
        end
      end

  end

  namespace :maintenance do
    desc "Turn on maintenance mode by creating maintenance.flag file"
    task :on do
      on roles(fetch(:magento_roles)) do
        within fetch(:magento_working_dir)  do
          execute :touch, "#{release_path}/maintenance.flag"
        end
      end
    end

    desc "Turn off maintenance mode by removing maintenance.flag file"
    task :off do
      on roles(fetch(:magento_roles)) do
        within fetch(:magento_working_dir)  do
          execute :rm, "-f", "#{release_path}/maintenance.flag"
        end
      end
    end
  end

  namespace :compiler do
    desc "Run compilation process and enable compiler include path"
    task :compile do
      on roles(fetch(:magento_roles)) do
        within fetch(:magento_working_dir).join('shell') do
          execute :php, "-f", "compiler.php", "--", "compile"
        end
      end
    end

    desc "Enable compiler include path"
    task :enable do
      on roles(fetch(:magento_roles)) do
        within "#{release_path}/shell" do
          execute :php, "-f", "compiler.php", "--", "enable"
        end
      end
    end

    desc "Disable compiler include path"
    task :disable do
      on roles(fetch(:magento_roles)) do
        within fetch(:magento_working_dir).join('shell') do
          execute :php, "-f", "compiler.php", "--", "disable"
        end
      end
    end

    desc "Disable compiler include path and remove compiled files"
    task :clear do
      on roles(fetch(:magento_roles)) do
        within fetch(:magento_working_dir).join('shell') do
          execute :php, "-f", "compiler.php", "--", "clear"
        end
      end
    end
  end

  namespace :indexer do
    desc "Reindex data by all indexers"
    task :reindexall do
      on roles(fetch(:magento_roles)) do
        within fetch(:magento_working_dir).join('shell') do
          execute :php, "-f", "indexer.php", "--", "reindexall"
        end
      end
    end
  end

  namespace :logs do
    desc "Clean logs"
    task :clean do
      on roles(fetch(:magento_roles)) do
        within fetch(:magento_working_dir).join('shell') do
          execute :php, "-f", "log.php", "--", "clean"
        end
      end
    end
  end
end

namespace :load do
  task :defaults do
    set :linked_dirs, fetch(:linked_dirs, []).push("var", "media", "sitemaps")
    set :linked_files, fetch(:linked_files, []).push("app/etc/local.xml")
    set :magento_roles, :all
    set :magento_working_dir, -> { release_path }
  end
end
