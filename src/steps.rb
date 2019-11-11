module Provision
  module Steps
    MY_CONFIGS_SCRIPTS_DIR = '${HOME}/Projects/my-configs/scripts'

    def self.post_prepare(config, provision_vars)
      Utils::provision_script(config, 'post_prepare', "#{MY_CONFIGS_SCRIPTS_DIR}/prepare/prepare-my-configs.sh")
      Utils::provision_script(config, 'post_prepare', "#{MY_CONFIGS_SCRIPTS_DIR}/prepare/prepare-secrets.sh")
    end

    def self.post_install(config, provision_vars)
      Utils::provision_script(config, 'post_install', "#{MY_CONFIGS_SCRIPTS_DIR}/install/install-utils.sh")
    end

    def self.post_configure(config, provision_vars)
      Utils::provision_script(config, 'post_configure', "#{MY_CONFIGS_SCRIPTS_DIR}/configure/configure-tilda.sh")
      Utils::provision_script(config, 'post_configure', "#{MY_CONFIGS_SCRIPTS_DIR}/configure/configure-yarn.sh")
      Utils::provision_script(config, 'post_configure', "#{MY_CONFIGS_SCRIPTS_DIR}/configure/configure-intellij.sh")
      Utils::provision_script(config, 'post_configure', "#{MY_CONFIGS_SCRIPTS_DIR}/configure/import/import-configs.sh")
    end

    def self.post_cleanup(config, provision_vars)
      Utils::provision_script(config, 'post_cleanup', "#{MY_CONFIGS_SCRIPTS_DIR}/cleanup/git-clone-all.sh")
      Utils::provision_script(config, 'post_cleanup', "#{MY_CONFIGS_SCRIPTS_DIR}/cleanup/git-pull-all.sh")
    end
  end
end
